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

                                <label class="menu-select">
                                    <input type="checkbox" class="select-item"
                                           data-name="${item.name}" 
                                           data-price="${item.price}">
                                    Select
                                </label>
                            </div>
                        `;
                    });

                    html += '</div>';
                    menuContent.html(html);

                    $(".select-item").change(function () {
                        const name = $(this).data("name");
                        const price = $(this).data("price");

                        if ($(this).is(":checked")) {
                            addItem(name, price);
                        } else {
                            removeItemByName(name);
                        }
                    });
                }
            });
        }

        function addItem(name, price) {
            order.push({ name, price, qty: 1 });
            renderOrder();
        }
        function removeItem(index) {
            const name = order[index].name;
            $(`.select-item[data-name="${name}"]`).prop("checked", false);
            order.splice(index, 1);
            renderOrder();
        }

        function removeItemByName(name, cameFromCheckbox = false) {
            const index = order.findIndex(i => i.name === name);
            if (index !== -1) {
                order.splice(index, 1);
                renderOrder();
            }
            if (!cameFromCheckbox) {
                $(`.select-item[data-name="${name}"]`).prop("checked", false);
            }
        }

        function renderOrder() {
            const list = $("#order-list");
            let html = "";

            order.forEach((item, index) => {
                html += `
                    <div class="order-item">
                        <span>${item.name} – ${item.price}</span>

                        <div class="qty-box">
                            <button class="qty-btn minus" data-index="${index}">-</button>
                            <span class="qty-number">${item.qty}</span>
                            <button class="qty-btn plus" data-index="${index}">+</button>
                        </div>

                        <button class="remove-btn" data-index="${index}">❌</button>
                    </div>
                `;
            });

            list.html(html);
            $(".remove-btn").click(function () {
                removeItem($(this).data("index"));
            });

            $(".qty-select").change(function () {
                const index = $(this).data("index");
                const newQty = parseInt($(this).val());

                order[index].qty = newQty;
                updateTotal();
            });

            $(".qty-btn.plus").click(function () {
                const index = $(this).data("index");
                order[index].qty++;
                renderOrder();
            });

            $(".qty-btn.minus").click(function () {
                const index = $(this).data("index");

                if (order[index].qty != 1) {
                    order[index].qty--;
                }           
                renderOrder();
            });

            updateTotal();
        }

        function updateTotal() {
            let total = 0;
            order.forEach(i => {
                total += parseFloat(i.price.replace("€", "")) * i.qty;
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
