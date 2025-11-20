$(document).ready(function () {
    const currentPage = window.location.pathname.split("/").pop().toLowerCase();

    // --- Default.aspx --- //
    if (currentPage.includes("default")) {
        const tabs = $(".tab");
        const menuContent = $("#menu-content");
        let order = [];
        function renderMenu(category) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/GetMenuItems",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ category }),
                dataType: "json",
                success: function (response) {
                    const items = response.d;
                    let html = '<div class="menu-items">';

                    items.forEach((item, index) => {
                        html += `
                        <div class="menu-item">
                            <h3>${item.name}</h3>
                            <p>${item.desc}</p>
                            <span class="price">${item.price}</span>
                            <button class="add-btn" data-name="${item.name}" data-price="${item.price}">
                                Add
                            </button>
                        </div>
                    `;
                    });

                    html += '</div>';
                    menuContent.html(html);

                    $(".add-btn").click(function () {
                        addItem($(this).data("name"), $(this).data("price"));
                    });
                }
            });
        }

        function addItem(name, price) {
            order.push({ name, price });
            renderOrder();
        }

        function removeItem(index) {
            order.splice(index, 1);
            renderOrder();
        }

        function renderOrder() {
            const list = $("#order-list");
            let html = "";

            order.forEach((item, index) => {
                html += `
                <div class="order-item">
                    <span>${item.name} – ${item.price}</span>
                    <button class="remove-btn" data-index="${index}">❌</button>
                </div>
            `;
            });

            list.html(html);

            $(".remove-btn").click(function () {
                removeItem($(this).data("index"));
            });

            updateTotal();
        }

        function updateTotal() {
            let total = 0;
            order.forEach(i => {
                total += parseFloat(i.price.replace("€", ""));
            });
            $("#total-price").text("€" + total.toFixed(2));
        }

        renderMenu("Pancake");

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

});
