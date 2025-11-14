$(document).ready(function () {
    const currentPage = window.location.pathname.split("/").pop().toLowerCase();

    // --- Default.aspx --- //
    if (currentPage.includes("default")) {

        function renderMenu(category) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/GetMenuItems",
                data: JSON.stringify({ category: category }), // Envia o parâmetro!
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const items = response.d;
                    let html = '<div class="menu-items">';
                    items.forEach(item => {
                        html += `
                            <div class="menu-item">
                                <h3>${item.name}</h3>
                                <p>${item.desc}</p>
                                <span class="price">${item.price}</span>
                            </div>`;
                    });
                    html += '</div>';
                    $("#menu-content").html(html);
                },
                error: function (xhr, status, error) {
                    console.error("Erro ao carregar dados:", error);
                }
            });
        }

        renderMenu("Pancake");

        // troca de aba
        $(".tab").click(function () {
            $(".tab").removeClass("active");
            $(this).addClass("active");
            const target = $(this).data("target");
            renderMenu(target);
        });
    }

    // --- About.aspx --- //
    if (currentPage.includes("about")) {
        console.log("📄 Página About detectada");

        // Aqui você coloca o JS específico da About page
        // Exemplo: animações, fades, ou carregar dados via AJAX
        $(".about-section").hide().fadeIn(1000);

        $("#show-more").click(function () {
            $(".extra-info").slideToggle();
        });
    }

    // --- FAQ.aspx --- //
    if (currentPage.includes("FAQ") || currentPage.includes("faq")) {
        console.info('Info');
        $(".faq-answer").hide();
        $("h4").click(function () {
            $(this).next("p").slideToggle(500);
        });
    }
});
