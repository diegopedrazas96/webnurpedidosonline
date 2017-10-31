<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestGoogleMap.aspx.cs" Inherits="Test_TestGoogleMap" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/1.0.17/webcomponents-lite.js"></script>
    <link rel="import" href="https://raw-dot-custom-elements.appspot.com/GoogleWebComponents/google-map/v2.0.2/google-map/google-map.html">

    

    <style>
        google-map {
            height: 500px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Literal ID="GMap" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
