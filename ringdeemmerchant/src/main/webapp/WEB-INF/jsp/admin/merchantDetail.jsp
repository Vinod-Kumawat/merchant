<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <title>Matrix Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../../assets/extra-libs/multicheck/multicheck.css">
    <link href="../../assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="../../dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <jsp:include page="../util/header-navbar.jsp"></jsp:include>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <jsp:include page="../util/sidebar.jsp"></jsp:include>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Merchant</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">View Merchant</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Merchant Details</h5>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <td>Sr No</td>
                                                <td>Company Name</td>
                                                <td>Merchant Mail</td>
                                               <!-- <td>Password</td> -->
                                                <td>Contact Name</td>
                                                <td>Country Code</td>
                                                <td>Mobile Number</td>
                                                <td>Description</td>
                                                <td>Business Address</td>
                                                <td>Business Number</td>
                                                <td>Tax Number</td>
                                                <td>Vat Tax</td>
                                                <td>Country</td>
                                                <td>Point</td>
                                                <td>View All product</td>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <!-- merchant data here -->
                                        <c:if test="${not empty merchantList}">

                                            <c:forEach var="merchant" items="${merchantList}">
                                            <tr>
                                                <td><a href="/editMerchant/${merchant.merchantId}" class="btn btn-success btn-cm">${merchant.merchantId}</a></td>
                                                <td>${merchant.companyName}</td>
                                                <td>${merchant.merchantMail}</td>
                                                <!-- <td>${merchant.password}</td> -->
                                                <td>${merchant.contactName}</td>
                                                <td>${merchant.countryCode}</td>
                                                <td>${merchant.mobileNumber}</td>
                                                <td>${merchant.description}</td>
                                                <td>${merchant.businessAddress}</td>
                                                <td>${merchant.businessNumber}</td>
                                                <td>${merchant.taxNumber}</td>
                                                <td>${merchant.vatTax}</td>
                                                <td>${merchant.country}</td>
                                                <td>${merchant.point}</td>
                                                <td>
                                                 <a href="/viewProductByMerchant/${merchant.merchantId}" class="btn btn-cyan btn-sm">view Product</a>
                                                </td>
                                                <td>
                                                    <a href="/editMerchant/${merchant.merchantId}" class="btn btn-cyan btn-sm">Edit</a>
                                                    <a href="/deleteMerchant/${merchant.merchantId}" class="btn btn-danger btn-sm">Delete</a>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </c:if>
                                        <!-- merchant data end -->
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td>Sr No</td>
                                                <td>Company Name</td>
                                                <td>Merchant Mail</td>
                                               <!-- <td>Password</td> -->
                                                <td>Contact Name</td>
                                                <td>Country Code</td>
                                                <td>Mobile Number</td>
                                                <td>Description</td>
                                                <td>Business Address</td>
                                                <td>Business Number</td>
                                                <td>Tax Number</td>
                                                <td>Vat Tax</td>
                                                <td>Country</td>
                                                <td>Point</td>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                Developed by <a href="#">@Vinu</a></a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../../assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../../assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="../../dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../../dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../../dist/js/custom.min.js"></script>
    <!-- this page js -->
    <script src="../../assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
    <script src="../../assets/extra-libs/multicheck/jquery.multicheck.js"></script>
    <script src="../../assets/extra-libs/DataTables/datatables.min.js"></script>
    <script>
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#zero_config').DataTable();
    </script>

</body>

</html>