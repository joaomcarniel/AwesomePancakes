$(document).ready(function () {
    const currentPage = window.location.pathname.split("/").pop().toLowerCase();
    console.log("Tamo aqui");

    if (currentPage.includes("booking")) {
        
    }
});

function GetSchedules() {
    var date = document.getElementById("txtDate").value;
    var numPeople = document.getElementById("ddlNumPeople").value;

    if (!date) return;

    PageMethods.GetBusySchedules(date, numPeople, function (busy) {
        var ddl = document.getElementById("ddlSchedule");
        ddl.innerHTML = "";

        var schedules = ["09:00:00", "10:00:00", "11:00:00", "14:00:00", "15:00:00", "16:00:00", "17:00:00", "18:00:00", "19:00:00", "20:00:00", "21:00:00"];

        schedules.forEach(function (s) {
            var option = document.createElement("option");
            option.value = s;

            if (busy.includes(s)) {
                option.text = s + " (sold out)";
                option.disabled = true;
                option.style.color = "gray";
            } else {
                option.text = s;
            }

            ddl.appendChild(option);
        });

        ddl.selectedIndex = -1;
    });
}