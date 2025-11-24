$(document).ready(function () {
    const today = new Date().toISOString().split("T")[0];
    document.getElementById("txtDate").setAttribute("min", today);
});

function GetSchedules() {
    var date = document.getElementById("txtDate").value;
    var numPeople = document.getElementById("ddlNumPeople").value;

    if (!date) {
        alert("Please choose a date first.");
        return;
    }

    // ----- BLOQUEAR AGORA + 2 HORAS -----
    const now = new Date();
    const minAllowed = new Date(now.getTime() + 2 * 60 * 60 * 1000); // agora + 2h

    const selectedDate = new Date(date + "T00:00:00");

    // Se for hoje, bloqueia horários antes de minAllowed
    const isToday =
        selectedDate.getFullYear() === now.getFullYear() &&
        selectedDate.getMonth() === now.getMonth() &&
        selectedDate.getDate() === now.getDate();

    PageMethods.GetBusySchedules(date, numPeople, function (busy) {

        var ddl = document.getElementById("ddlSchedule");
        ddl.innerHTML = "";

        var schedules = ["09:00:00", "10:00:00", "11:00:00", "14:00:00", "15:00:00",
            "16:00:00", "17:00:00", "18:00:00", "19:00:00", "20:00:00", "21:00:00"];

        schedules.forEach(function (s) {
            const scheduleDateTime = new Date(date + "T" + s);
            var option = document.createElement("option");
            option.value = s;
            if (busy.includes(s)) {
                option.text = s + " (sold out)";
                option.disabled = true;
                option.style.color = "gray";
            }

            else if (isToday && scheduleDateTime < minAllowed) {
                option.text = s + " (unavailable)";
                option.disabled = true;
                option.style.color = "gray";
            }
            else {
                option.text = s;
            }

            ddl.appendChild(option);
        });

        ddl.selectedIndex = -1;
    });
}
