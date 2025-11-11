$(document).ready(function () {
    const currentPage = window.location.pathname.split("/").pop().toLowerCase();

    // --- Default.aspx --- //
    if (currentPage.includes("default")) {
        const menuData = {
            pizza: [
                { name: "La Rossa", desc: "Tomato sauce, garlic, basil (no cheese)", price: "$15 / $24" },
                { name: "Margherita", desc: "Tomato sauce, mozzarella, basil", price: "$17 / $26" }
            ],
            burgers: [
                { name: "Classic Burger", desc: "Beef, cheese, tomato, lettuce", price: "$12" }
            ],
            snacks: [
                { name: "Fries", desc: "Crispy golden fries", price: "$5" }
            ],
            salads: [
                { name: "Caesar Salad", desc: "Romaine, croutons, parmesan", price: "$9" }
            ],
            drinks: [
                { name: "Coca-Cola", desc: "Cold and refreshing", price: "$3" }
            ]
        };

        function renderMenu(category) {
            const items = menuData[category];
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
        }

        renderMenu("pizza");

        $(document).on("click", ".tab", function (event) {
            event.preventDefault();
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
});
