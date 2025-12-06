$(document).ready(function () {
    const currentPage = window.location.pathname.split("/").pop().toLowerCase();

    if (currentPage.includes("staff")) {

        function renderStaff() {

            $.ajax({
                type: "POST",
                url: "Staff.aspx/GetStaff",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    const staff = response.d;
                    let html = '<div class="staff-grid">';

                    staff.forEach(member => {
                        html += `
                            <div class="staff-card" 
                                 data-name="${member.name}"
                                 data-role="${member.role}"
                                 data-desc="${member.description}"
                                 data-image="${member.image}">
                                
                                <img src="${member.image}" class="staff-photo" alt="${member.name}">
                                <h3>${member.name}</h3>
                                <h4>${member.role}</h4>
                                <p>${member.description}</p>
                            </div>
                        `;
                    });

                    html += '</div>';
                    $("#staff-container").html(html);

                    $("#staff-container").on("click", ".staff-card", function () {
                        const card = $(this);
                        $("#modal-photo").attr("src", card.data("image"));
                        $("#modal-name").text(card.data("name"));
                        $("#modal-role").text(card.data("role"));
                        $("#modal-description").text(card.data("desc"));
                        $("#staff-overlay").fadeIn(200);
                    });

                    $("#close-staff-modal").click(function () {
                        $("#staff-overlay").fadeOut(200);
                    });

                    $("#staff-overlay").click(function (e) {
                        if (e.target.id === "staff-overlay") {
                            $(this).fadeOut(200);
                        }
                    });
                },
                error: function (err) {
                    console.error("Error loading staff:", err);
                }
            });
        }
        $("#staff-overlay").hide();

        renderStaff();
    }
});
