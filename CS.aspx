<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
     <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.2/js/dataTables.fixedColumns.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="InputPaging.js"></script>
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>

    <script type="text/javascript">
      
        $(function () {
             $("[id*=GridView1]").DataTable(
            {
                bLengthChange: true,
                lengthMenu: [[5, 10, -1], [5, 10, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                pageLength: 10,
                pagingType: "input",
                scrollY: 300,
                scrollX: true,
                scrollCollapse: true,
                scroller: true,
                paging: true,
                fixedColumns: {
                    leftColumns: 2
                },
                fixedHeader: {
                    header: true,
                    footer: true
                }
                   
                })
            });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 800px" >
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="EMP_ID" HeaderText="Employee Id" />
                <asp:BoundField DataField="FIRST_NAME" HeaderText="First Name" />
                <asp:BoundField DataField="LAST_NAME" HeaderText="Last Name" />
                <asp:BoundField DataField="START_DATE" HeaderText="Start_Date" />
                  <asp:BoundField DataField="TITLE" HeaderText="Title" />
                <asp:BoundField DataField="ASSIGNED_BRANCH_ID" HeaderText="BRANCH_ID" />
                <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" />
                  <asp:BoundField DataField="SUPERIOR_EMP_ID" HeaderText="S_EMP_ID" />
                       <asp:BoundField DataField="END_DATE" HeaderText="END_DATE" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
    
    
</body>
</html>
