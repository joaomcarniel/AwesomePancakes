$(document).ready(function () {

    const currentPage = window.location.pathname.toLowerCase();

    if (currentPage.includes("about")) {

        const images = $(".carousel-img");
        let index = 0;

        function showImage(i) {
            images.removeClass("active");
            images.eq(i).addClass("active");
        }

        $(".carousel-btn.next").click(function (e) {
            e.preventDefault();
            index = (index + 1) % images.length;
            showImage(index);
        });

        $(".carousel-btn.prev").click(function (e) {
            e.preventDefault();
            index = (index - 1 + images.length) % images.length;
            showImage(index);
        });
    }
});
