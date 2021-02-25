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
    <link rel="stylesheet" type="text/css" href="../../assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/jquery-minicolors/jquery.minicolors.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/quill/dist/quill.snow.css">
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
            <jsp:include page="../merchantutil/header-navbar.jsp"></jsp:include>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <jsp:include page="../merchantutil/sidebar.jsp"></jsp:include>

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
                                    <li class="breadcrumb-item active" aria-current="page">Add Merchant</li>
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
                    <div class="col-md-12">
                        <div class="card">
                        <c:if test="${not empty message}">
                            <div class="alert alert-success">
                              <strong>Success!</strong> ${message}.
                            </div>
                        </c:if>
                            <form:form method="post" modelAttribute="merchantForm" action="${contextPath}/saveMerchant" class="form-horizontal">
                                <div class="card-body">
                                    <h4 class="card-title">Add New Merchant</h4>
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="company" class="col-sm-3 text-left control-label col-form-label">Company Name</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="companyName">
                                                <form:input type="text" path="companyName" class="form-control" id="company" placeholder="Company Name"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="merchantEmail" class="col-sm-3 text-left control-label col-form-label">Merchant Email</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="merchantMail">
                                                <form:input  type="text" path="merchantMail" class="form-control" id="merchantEmail" placeholder="Merchant Email"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="password" class="col-sm-3 text-left control-label col-form-label">Set Password</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="password">
                                                <form:input  type="text" path="password" class="form-control" id="password" placeholder="Password"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="contactName" class="col-sm-3 text-left control-label col-form-label">Contact Name</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="contactName">
                                               <form:input type="text" path="contactName" class="form-control" id="lname" placeholder="Last Name Here"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="countryCode" class="col-sm-3 text-left control-label col-form-label">Country Code</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="countryCode">
                                                <form:input type="text" path="countryCode" class="form-control" id="countryCode" placeholder="Country Code"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="mobileNumber" class="col-sm-3 text-left control-label col-form-label">Mobile Number</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="mobileNumber">
                                               <form:input type="text" path="mobileNumber" class="form-control" id="mobileNumber" placeholder="Mobile Number here"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="description" class="col-sm-3 text-left control-label col-form-label">Description </label>
                                            <div class="col-sm-9">
                                            <spring:bind path="description">
                                                <form:textarea type="textarea" path="description" class="form-control" id="description" placeholder="description here"></form:textarea>
                                            </spring:bind>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="image" class="col-sm-3 text-left control-label col-form-label">Image </label>
                                            <div class="col-sm-9">
                                            <spring:bind path="image">
                                               <form:input type="file" path="image" class="form-control" id="image" placeholder="Mobile Number here"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                    </div>

                                    <h4>Invoice information</h4>
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="businessAddress" class="col-sm-6 text-left control-label col-form-label">Business Address</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="businessAddress">
                                                <form:textarea path="businessAddress" class="form-control" id="businessAddress" placeholder="Business Address"></form:textarea>
                                            </spring:bind>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="businessNumber" class="col-sm-6 text-left control-label col-form-label">Business Number</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="businessNumber">
                                               <form:input type="text" path="businessNumber" class="form-control" id="businessNumber" placeholder="Business Number here"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="taxNumber" class="col-sm-3 text-left control-label col-form-label">Tax Number </label>
                                            <div class="col-sm-9">
                                            <spring:bind path="taxNumber">
                                                <form:input type="text" path="taxNumber" class="form-control" id="taxNumber" placeholder="Tax Number"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="vatTax" class="col-sm-3 text-left control-label col-form-label">Vat Tax</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="vatTax">
                                               <form:input type="text" path="vatTax" class="form-control" id="vatTax" placeholder="Vat Tax"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="country" class="col-sm-3 text-left control-label col-form-label">Country </label>
                                            <div class="col-sm-9">
                                            <spring:bind path="country">
                                                <form:input type="text" path="country" class="form-control" id="country" placeholder="Country"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="point" class="col-sm-3 text-left control-label col-form-label">Point</label>
                                            <div class="col-sm-9">
                                            <spring:bind path="point">
                                               <form:input type="text" path="point" class="form-control" id="point" placeholder="point"></form:input>
                                            </spring:bind>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                         <button class="btn btn-success float-right" type="submit">Save Merchant</button>
                                    </div>
                                </div>
                            </form:form>
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
    <!-- This Page JS -->
    <script src="../../assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <script src="../../dist/js/pages/mask/mask.init.js"></script>
    <script src="../../assets/libs/select2/dist/js/select2.full.min.js"></script>
    <script src="../../assets/libs/select2/dist/js/select2.min.js"></script>
    <script src="../../assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
    <script src="../../assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <script src="../../assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
    <script src="../../assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
    <script src="../../assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="../../assets/libs/quill/dist/quill.min.js"></script>
    <script>
        //***********************************//
        // For select 2
        //***********************************//
        $(".select2").select2();

        /*colorpicker*/
        $('.demo').each(function() {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });

        });
        /*datwpicker*/
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        });

    </script>
</body>

</html>