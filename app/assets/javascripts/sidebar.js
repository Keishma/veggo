document.addEventListener("turbolinks:load", function() {

        $('#dismiss, .overlay').on('click', function () {
            $('#sidebar').removeClass('active');
            $('.overlay').removeClass('active');
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').addClass('active');
            $('.overlay').addClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    });

    //   $(document).ready(function () {
    //     $('#sidebarCollapse').on('click', function () {
    //         alert("ya cunt");
    //     });
    // });


    // $('#sidebarCollapse').on('click', function () {
    //     console.log("hello");
    // });