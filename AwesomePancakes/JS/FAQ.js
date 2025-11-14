$(document).ready(function () {
    const currentPage = window.location.pathname.split("/").pop().toLowerCase();

    if (currentPage.includes("faq")) {

        function RenderFaq() {
            console.log("AQui estou mais um dia");

            $.ajax({
                type: "POST",
                url: "FAQ.aspx/GetFaqItems",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const items = response.d;
                    let html = '<div class="faq-container">';

                    items.forEach(item => {
                        html += `
                            <div id="faq-container">
                                <div class="faq-question">${item.question}</div>
                                <div class="faq-answer">${item.answer}</div>
                            </div>`;
                    });

                    html += '</div>';
                    $("#menu-content-faq").html(html);

                    // Add toggle behavior AFTER rendering
                    $(".faq-answer").hide();

                    $(".faq-question").click(function () {
                        $(this).next(".faq-answer").slideToggle(300);
                    });
                },
                error: function (xhr, status, error) {
                    console.error("Error loading FAQ:", error);
                }
            });
        }

        RenderFaq();
    }
});
