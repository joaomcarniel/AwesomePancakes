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
                            <div class="staff-card">
                                <img src="${member.image}" class="staff-photo" alt="${member.name}">
                                <h3>${member.name}</h3>
                                <h4>${member.role}</h4>
                                <p>${member.description}</p>
                            </div>
                        `;
                    });

                    html += '</div>';

                    $("#staff-container").html(html);
                },
                error: function (err) {
                    console.error("Error loading staff:", err);
                }
            });
        }

        renderStaff();
    }
});
