﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportPhotoPXN.aspx.cs" Inherits="VNPay_Web.Report.ReportPhotoPXN" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../slider/css/jquery.ad-gallery.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        $(function () {
            var galleries = $('.ad-gallery').adGallery();
        });
        function openNewImage(file, AuditID) {
            popWindow_ImageAudit("../popup/ImagesAuditDetail.aspx?src1=" + file + "&AuditID=" + AuditID, 820, 635);
        }
        function popWindow_ImageAudit(link, width, height) {
            var w = width, h = height;
            var left = (screen.width / 2) - (w / 2);
            var top = 10;
            window.open(link, 'popup', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
            return false;
        }

    </script>
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../slider/js/jquery.ad-gallery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Literal runat="server" ID="ltrSlider"></asp:Literal>
        </div>
    </form>
</body>
</html>
