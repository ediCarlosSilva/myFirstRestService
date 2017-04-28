<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyRESTServiceCaller.aspx.cs" Inherits="MyRESTClient.MyRESTServiceCaller" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () 
        {
            $.ajax({
                type: "GET",
                dataType:"xml",
                success: function(xml) {
                    $(xml).find('Product').each(function() {
                        var id = $(this).find('ProductId').text();
                        var name = $(this).find('Price').text();
                        var price = $(this).find('Price').text();
                        var category = $(this).find('CategoryName').text();
                        $('<tr><td>' + id + '</td><td>' + name + '</td><td>' + price + '</td><td>' +
                            category + '</td></tr>').appendTo('#products');
                    });
                },
                error: function(xhr) {
                    alert(xhr.responseText);
                },
                url: "http://localhost:49210/ProductRESTService.svc/GetProductList”
            });
        });
        </script>
</head>
<body>
    

    <table border="1" data-="products">
        <%--Make a Header Row--%>
        <tr>
            <td><b>Product Id</b></td>
            <td><b>Name</b></td>
            <td><b>Price</b></td>
            <td><b>Category</b></td>
        </tr>
        
    </table>
</body>
</html>
