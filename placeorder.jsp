<%-- JSP directive --%>
<%!
private static ArrayList<ArrayList<String>> getpowerset(int n,
			ArrayList<ArrayList<String>> powerSet, ArrayList<String> lItem) {
		if (n == 0) {
			ArrayList<String> al = new ArrayList<String>();
			al.add(" ");
			powerSet.add(al);
			return powerSet;
		}

		powerSet = getpowerset(n - 1, powerSet, lItem);
		ArrayList<ArrayList<String>> temp = new ArrayList<ArrayList<String>>();
		for (ArrayList<String> tempStr : powerSet) {
			if (tempStr.get(0).equals(" ")) {
				ArrayList<String> al = new ArrayList<String>();
				al.add(lItem.get(n - 1));
				temp.add(al);
			} else {
				ArrayList<String> al = new ArrayList<String>(tempStr);
				al.add( lItem.get(n-1));
				temp.add(al);
			}
		}
		powerSet.addAll(temp);
		return powerSet;
		}
%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*,java.util.Date,java.text.SimpleDateFormat" %>
<% 
			//**declare variables for insertion
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            ResultSet    rs;
            
			//** check session status and obtain data from shoppingcart.jsp
           
		   if(session.getAttribute("username")==null)
            	out.print("<script type='text/javascript'>alert('please login');document.location.href='shoppingcart.jsp';</script>");
            else{
            Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String dates = dateFormat.format( now ); 
			String email=  (String)session.getAttribute("username");
            String name=request.getParameter("Full Name");
            String addr1=request.getParameter("Address Line 1");
            String addr2=request.getParameter("Address Line 2");
            String city=request.getParameter("City");
            String state=request.getParameter("State");
            String zip=request.getParameter("Zip");
            String country=request.getParameter("Country");
            String phone=request.getParameter("Phone Number");
            String item=request.getParameter("items");
            String address="Full Name:"+name+"; Address:"+addr1+","+addr2+"; City:"+city+"; State:"+state+"; Zip:"+zip+"; Country:"+country+"; Phone:"+phone;
			String       uname="project";
            String       passwd="880224";
          
            //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                stmt = con.createStatement();
                 int orderId = 0;
				
				//** assign primary key for the orders 
				String query1 = "SELECT max(order_id) from orders";
                rs = stmt.executeQuery(query1);
                if(rs.next()) 
                {  
                 
					if (rs.getString(1)== null )
					 {
					 orderId = 0;
					 }
					else 	 
					{
					orderId =  Integer.parseInt(rs.getString(1));
					orderId++;
					}
				}
		
		//*** first insert the new orders and then do data mining if the number of orders is the multiple of 10
		//*****************************ignore all the code inside try ********************************************//
        try{
		
			String query="INSERT INTO orders VALUES (" + orderId+ ",'"+email+"','"+dates+"','"+item+"','"+address+"' )"; 
			//*** execute query and show result
            rs = stmt.executeQuery(query);    
			if(orderId%10==0){
				 session.invalidate(); 
				 out.print("<script type='text/javascript'>alert('Good');document.location.href='index.jsp';</script>"); 
			}
			
			query ="SELECT items from orders";
			stmt.executeQuery("delete from ASSOCIATIONRULES");
			ResultSet rs2 = stmt.executeQuery(query);
			String orders = ""; // data file
			while(rs2.next()){
				String temp = "";
				temp =  rs2.getString(1);
				orders += temp+"`";
				}
				out.print(orders);
			double supportLine=0.3; // support limit
			double confidenceLine=0.5; // confidence limit
			ArrayList<ArrayList<String>> items = new ArrayList<ArrayList<String>>(); 
			ArrayList<ArrayList<String>> transactions = new ArrayList<ArrayList<String>>();
			ArrayList<ArrayList<String>> largeItemSet = new ArrayList<ArrayList<String>>();
			ArrayList<String> associationRules = new ArrayList<String>(); 
			Hashtable<HashSet<String>, Integer> c = new Hashtable<HashSet<String>, Integer>(); 
			Hashtable<Integer, ArrayList<ArrayList<String>>> C = new Hashtable<Integer, ArrayList<ArrayList<String>>>(); 
			String[] trans = orders.split("`");

			for(String temStr:trans) {
				ArrayList<String> re = new ArrayList<String>();
				String[] str =temStr .split(";");
				for (String temp : str) {
				temp = temp.substring(temp.indexOf("book_id:")+8,temp.indexOf("----"));
					re.add(temp);
					//out.println(temp+"+++");
				}
				transactions.add(re);
			}
			ArrayList<String> temItem = transactions.get(0);
			for (int i = 0; i < temItem.size(); i++) {
				ArrayList<String> oneItem = new ArrayList<String>();
				oneItem.add(temItem.get(i));
				items.add(oneItem);
			}

			// get all Items from transactions
			for (int i = 1; i < transactions.size(); i++) {
				temItem = transactions.get(i);
				boolean noSuchWord = true;
				for (int k = 0; k < temItem.size(); k++) {
					for (int j = 0; j < items.size(); j++) {
						if (items.get(j).get(0).equals(temItem.get(k)))
							noSuchWord = false;
					}
					if (noSuchWord == true) {
						ArrayList<String> oneItem = new ArrayList<String>();
						oneItem.add(temItem.get(k));
						items.add(oneItem);
					}
					noSuchWord = true;
				}
			}// end get Items
			C.put(new Integer(0), items);
			
			
			
			
			int key = 0;
			ArrayList<ArrayList<String>> tempC = new ArrayList<ArrayList<String>>();
			// System.out.println(C);
			while ((tempC = C.get(key)).size() != 0) {

				key++;
				ArrayList<ArrayList<String>> tempLargeSet = new ArrayList<ArrayList<String>>();
				for (int j = 0; j < tempC.size(); j++) {
					HashSet<String> hs = new HashSet<String>();
					hs.addAll(tempC.get(j));
					c.put(hs, new Integer(0));
				}
				// System.out.println(c.get(items.get(0)));
				for (ArrayList<String> transaction : transactions) {
					for (ArrayList<String> condicate : tempC) {
						{
							boolean isContain = true;
							boolean tempContain = false;
							for (String str1 : condicate) {
								for (String str2 : transaction) {
									if (str1.equals(str2))
										tempContain = true;
								}
								isContain = isContain && tempContain;
								tempContain = false;
							}
							if (isContain) {
								HashSet<String> hs = new HashSet<String>();
								hs.addAll(condicate);
								int count = c.get(hs);
								count++;
								c.put(hs, new Integer(count));
							}
							isContain = false;
						}
					}
				}

				for (ArrayList<String> condicate : tempC) {
					HashSet<String> hs = new HashSet<String>();
					hs.addAll(condicate);
					if (c.get(hs).intValue() >= (transactions.size() * supportLine)) {
						largeItemSet.add(condicate);
						tempLargeSet.add(condicate);

					}
				}
				
				
				HashSet<HashSet<String>> unionOfC = new HashSet<HashSet<String>>();
				ArrayList<ArrayList<String>> returnArray = new ArrayList<ArrayList<String>>();
				int count = 0;
				for (int i = 0; i < tempLargeSet.size() - 1; i++) {
					for (int j = i + 1; j < tempLargeSet.size(); j++) {
						ArrayList<String> tempStr1 = new ArrayList<String>(tempLargeSet.get(i));
						ArrayList<String> tempStr2 = new ArrayList<String>(tempLargeSet.get(j));
						for (String str1 : tempStr1)
							for (String str2 : tempStr2) {
								if (str1.equals(str2))
									count++;
							}
						if (count == key - 1) {
							HashSet<String> tempHash = new HashSet<String>();
							Set<String> set = new HashSet<String>();
							set.addAll(tempStr1);
							set.addAll(tempStr2);
							tempHash.addAll(new ArrayList<String>(set));
							
							unionOfC.add(tempHash);
						}
						count = 0;
					}

				}
				Iterator<HashSet<String>> iter = unionOfC.iterator();
				while (iter.hasNext()) {
					ArrayList<String> al = new ArrayList<String>(iter.next());
					returnArray.add(al);
				}

				C.put(key, returnArray);
			}
			
			
			
			ArrayList<ArrayList<String>> powerSet = new ArrayList<ArrayList<String>>();
			for (ArrayList<String> lItem : largeItemSet) {

				powerSet = getpowerset(lItem.size(), powerSet, lItem);
				powerSet.remove(0);
				//System.out.println(lItem);
				//System.out.println(powerSet););
				for (ArrayList<String> str1 : powerSet) {
					HashSet<String> hs1 = new HashSet<String>();
					hs1.addAll(str1);
					HashSet<String> hs2 = new HashSet<String>();
					hs2.addAll(lItem);
					double a1 = (double) c.get(hs1);
					double a2 = (double) c.get(hs2);
					//System.out.println(a1+""+a2);
					if ((a2 / a1) >= confidenceLine) {
						hs2.removeAll(hs1);
						if(hs2.size()!=0)
							{
							associationRules.add(hs1 + "=>" + hs2);
							String itemx="",itemy="";
							Iterator<String> iter1 = hs1.iterator();
							while (iter1.hasNext()) {
								itemx= iter1.next()+";";
							}
							Iterator<String> iter2 = hs2.iterator();
							while (iter2.hasNext()) {
								itemy= iter2.next()+";";
							}
							stmt.executeQuery(
							"INSERT INTO ASSOCIATIONRULES (ITEMX, ITEMY, SUPPORT,CONFIDENCE)VALUES ('"+itemx+"','"+itemy+"',"+ a1/transactions.size()+","+a2/a1+")"
							);
							}
					}
				}
\				powerSet.clear();
			}
			session.invalidate(); 
			out.print("<script type='text/javascript'>alert('success');document.location.href='index.jsp';</script>");    
                	          
                
				
		}// **********************************end of try*****************************************// 		
		catch(Exception e){
			
		out.print("<script type='text/javascript'>alert('fail');document.location.href='index.jsp';</script>");
		e.printStackTrace();
		}
		stmt.close();            
		con.close();
    }

	
%>
