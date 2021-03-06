<%-- 
    Document   : SponsorEventInterface
    Created on : Dec 29, 2020, 5:53:46 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface SponsorEventInterface {

	/**
	 * 
	 * @param userName
	 * @param userID
	 * @param userEmail
	 * @param userPhoneNum
	 * @param eventSponsorAmt
	 * @param eventID
	 * @param sponsorImgProof
	 */
	public void addNewSponsorData(String userName, int userID, String userEmail, String userPhoneNum, double eventSponsorAmt, int eventID, String sponsorImgProof);

	public void sponsorConfirmation();

}%>

<!DOCTYPE html>
<html>
    <head>
        <title>Join Event</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href='style.css'/>
        
        <jsp:include page="../../allModules/bootstrap4.jsp" />
        
        <style>
            .custom-shadow {
                box-shadow: rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .center {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container-custom {
                display: block;
                margin-right: auto;
                margin-left: auto;
                width: 80%;
                padding: 10px 0 10px 150px;
            }
            .header-home {
                text-align: center;
            }
            @media only screen and (max-width: 600px) {.container-custom {padding-left: 10px; padding-top: 110px;}}
        </style>
    </head>
    <body>
        <%  if(session.getAttribute("user") != null) { %>
        <jsp:useBean id="user" type="com.models.user.User" scope="session" />
        <jsp:include page="../../allModules/sideNavigationBar.jsp" />
        
        <div class="container-custom">
            
            <nav class="navbar navbar-dark bg-dark">
                <div style="height:36px">
                    <p class="navbar-brand">SPONSOR EVENT</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 10px;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>
    
    <% 
        int eventID =(Integer)session.getAttribute("eventIDSponsor");
        double eventSponsorPackageAmt =(Double)session.getAttribute("eventSponsorPackageAmt");
        String message = (String)session.getAttribute("alertMsg");
    %>
    
    <% if(!message.equals("no")){ %>
        <script type="text/javascript">
        var msg = "<%=message%>";
        alert(msg);
    </script>
    <%}%>
    
    <form  name="AddParticipantform" method="post" action="ViewPageControl" enctype="multipart/form-data">
            <div class="container pb-5">
            <div class="row align-items-start justify-content-center"></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card mb-2 bg-light text-dark" style="width: auto;">
                        <div class="card-body">
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Name</label>
                                    <input type="text" class="form-control-plaintext" id="floatingInput" placeholder="Name of the Sponsor" name="userName" value="<%=user.getName()%>" size="100" readonly required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">User ID</label>
                                    <input type="text" class="form-control-plaintext" id="floatingInput" placeholder="ID of the Sponsor" name="userID" value="<%=user.getUserID()%>" size="100"  readonly required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Email Address</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Email Address of the Sponsor" name="userEmail" value="<%=user.getEmail()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Phone Number</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Phone Number of the Sponsor" name="userPhoneNum" value="<%=user.getPhoneNum()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Sponsor Package Amount</label>
                                    <input type="number" class="form-control" id="floatingInput" placeholder="Package Amount of the Sponsor" name="eventSponsorAmt" min="1" step="1" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Proof of Sponsor Payment</label>
                                    <input type="file" class="form-control" style="height:41px;" id="floatingInput" placeholder="Upload Proof of Payment" name="sponsorImgProofImage" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <input type="hidden" name="eventID" value=<%=eventID %> >
                        </div>
                    </div>
                    <div class="d-grid gap-2 col-4 mx-auto pt-1">
                        <input class="btn btn-warning" type="reset" id="button2" name="buttonreset" value="Reset Form">
                        <input class=" btn btn-primary" type="submit" id="button1" name="buttonSubmitSponsor" value="Sponsor Event">                                            
                    </div>
                </div>
            </div>
            </div>
    </form>
  
    <form  name="AddParticipantform" method="post" action="ViewPageControl" enctype="multipart/form-data">
        <div class="d-grid gap-2 col-1 mx-auto pt-1"> 
            <input type="hidden" name="eventID" value=<%=eventID %> >
            <input class=" btn btn-success" type="submit" id="button1" name="buttonBackEvent" value="Back"> 
        </div>
    </form>  
  </div>
</div>
<%--        <form  name="AddSponsorform" method="post" action="ViewPageControl" enctype="multipart/form-data">
      <table align="center" width="500" border="5" cellspacing="5" cellpadding="5">
          
        <tr>
          <th width="72" scope="row">
              <div align="left">ID</div></th>
          <td width="240">
              <label>
                  <input type="text" name="userID" id="userID" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th width="72" scope="row">
              <div align="left">Name</div></th>
          <td width="240">
              <label>
                  <input type="text" name="userName" id="userName" size="100" >
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Email Address</div>
          </th>
          <td>
              <label>
                  <input type="text" name="userEmail" id="userEmail" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Telephone Number</div>
          </th>
          <td>
              <label>
                  <input type="text" name="userPhoneNum" id="userPhoneNum" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Sponsor Package Amount</div>
          </th>
          <td>
              <label>
                  RM<%=eventSponsorPackageAmt%>
                  <br><br>
                  <input type="number" id="eventSponsorAmt" name="eventSponsorAmt" min="1" step="1">
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Payment Proof Image</div>
          </th>
          <td>
              <label>
                  <input type="file" name="sponsorImgProofImage" id="sponsorImgProofImage" required>
              </label>
          </td>
        </tr>
        
        <input type="hidden" name="eventID" value=<%=eventID %> >
        
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td>&nbsp;</td>
        </tr>
        
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td><label>
                  
            <input type="submit" name="buttonSubmitSponsor" id="button1" value="Add">
            <input type="reset" name="buttonreset" id="button2" value="Reset">
          </label></td>
        </tr>
        
      </table>
    </form>--%>
        
<%--    <br><br>
    <form action="ViewPageInterface.jsp">
    <table border="0" align="center">
      <tr>
        <td><input type="submit" value="Go back" /></td>
      </tr>
    </table>
    </form>--%>
    <jsp:include page="../../allModules/footer.jsp" />
<%  } %>
    </body>
</html>