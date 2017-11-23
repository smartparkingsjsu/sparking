$(document).ready(function() {
    var timeNow = new Date();
    var sortedDateKeys = [];
    var sortedDateHash= {};
    var closestReservation = getClosestReservation();
    var reservationTime = closestReservation.date;

    var displayTime = daysBetween(reservationTime, timeNow);
    var newDisplayTime = calculateNewTime(displayTime);

    var $timeEnum = {
        "day1": $('#day1'), "day2": $('#day2'), "day3": $('#day3'),
        "hour1": $('#hour1'), "hour2": $('#hour2'),
        "min1": $('#min1'), "min2": $('#min2'),
        "sec1": $('#sec1'), "sec2": $('#sec2')
    };

    if (newDisplayTime.day[1] != "-") {
        updateInfo(reservationTime.toDateString(), closestReservation.location, closestReservation.code);
        updateCurrentTime(displayTime.day, displayTime.hour, displayTime.minute, displayTime.second);
        updateNextTime(newDisplayTime.day, newDisplayTime.hour, newDisplayTime.minute, newDisplayTime.second);

        updateClockLoop();
    }
    else {
        updateInfo("N/A", "N/A", "N/A");
        updateCurrentTime("000", "00", "00", "00");
    }

    function updateCurrentTime(day, hour, minute, second) {
        setCurrentDigitTime(day[0], $timeEnum.day1);
        setCurrentDigitTime(day[1], $timeEnum.day2);
        setCurrentDigitTime(day[2], $timeEnum.day3);
        setCurrentDigitTime(hour[0], $timeEnum.hour1);
        setCurrentDigitTime(hour[1], $timeEnum.hour2);
        setCurrentDigitTime(minute[0], $timeEnum.min1);
        setCurrentDigitTime(minute[1], $timeEnum.min2);
        setCurrentDigitTime(second[0], $timeEnum.sec1);
        setCurrentDigitTime(second[1], $timeEnum.sec2);
    }

    function updateNextTime(day, hour, minute, second) {
        setNewDigitTime(day[0], $timeEnum.day1);
        setNewDigitTime(day[1], $timeEnum.day2);
        setNewDigitTime(day[2], $timeEnum.day3);
        setNewDigitTime(hour[0], $timeEnum.hour1);
        setNewDigitTime(hour[1], $timeEnum.hour2);
        setNewDigitTime(minute[0], $timeEnum.min1);
        setNewDigitTime(minute[1], $timeEnum.min2);
        setNewDigitTime(second[0], $timeEnum.sec1);
        setNewDigitTime(second[1], $timeEnum.sec2);
    }

    function setCurrentDigitTime(time, $element) {
        $element.children().first().children().first().text(time);
    }

    function setNewDigitTime(time, $element) {
        $element.children().first().children().last().text(time);
    }

    function daysBetween(date1, date2) {
        // Convertion times
        var oneSecond = 1000;
        var oneMinute = oneSecond*60;
        var oneHour = oneMinute*60;
        var oneDay = oneHour*24;

        // Convert both dates to milliseconds
        var date1Ms = date1.getTime();
        var date2Ms = date2.getTime();

        // Calculate the difference in milliseconds
        var differenceMs = Math.abs(date2Ms - date1Ms);

        var days = Math.floor(differenceMs/oneDay);
        var hours = Math.abs(Math.floor((differenceMs - (days*oneDay))/oneHour));
        var minutes = Math.abs(Math.floor((differenceMs - (days*oneDay) - (hours*oneHour))/oneMinute));
        var seconds = Math.abs(date1.getSeconds() - date2.getSeconds());

        // Convert back to days and return
        return {
            "day": parseDigits(3, days),
            "hour": parseDigits(2, hours),
            "minute": parseDigits(2, minutes),
            "second": parseDigits(2, seconds)
        };
    }

    function parseDigits(digitsNumber, number) {
        var pad = ""
        for(var i=0; i < digitsNumber; i++) {
            pad += "0";
        }
        return (pad + number).slice(-digitsNumber);
    }

    function calculateNewTime(time) {
        var day = time.day;
        var hour = time.hour;
        var minute = time.minute;
        var second = time.second;

        second = second - 1;

        if (second == "-1") {
            second = "59";
            minute = minute - 1;
        }

        if (minute == "-1") {
            minute = "59";
            hour = hour - 1;
        }

        if (hour == "-1") {
            hour = "23";
            day = day - 1;
        }

        return {
            "day": parseDigits(3, day),
            "hour": parseDigits(2, hour),
            "minute": parseDigits(2, minute),
            "second": parseDigits(2, second)
        }
    }

    function updateClockLoop() {
        var speed = 900;
        moveDifferent($timeEnum.day1, speed);
        moveDifferent($timeEnum.day2, speed);
        moveDifferent($timeEnum.day3, speed);
        moveDifferent($timeEnum.hour1, speed);
        moveDifferent($timeEnum.hour2, speed);
        moveDifferent($timeEnum.min1, speed);
        moveDifferent($timeEnum.min2, speed);
        moveDifferent($timeEnum.sec1, speed);
        moveDifferent($timeEnum.sec2, speed);

        setTimeout(updateClockLoop, 1000);
    }

    function moveDifferent($element, speed) {
        var val1 = $element.children().first().children().first().text();
        var val2 = $element.children().first().children().last().text();

        if (val1 != val2) {
            $element.animate({bottom: "-100%"}, speed, function() {
                displayTime = Object(newDisplayTime);
                newDisplayTime = calculateNewTime(displayTime);
                updateCurrentTime(displayTime.day, displayTime.hour, displayTime.minute, displayTime.second);
                updateNextTime(newDisplayTime.day, newDisplayTime.hour, newDisplayTime.minute, newDisplayTime.second);
                $element.css({"bottom": "0%"});
            });
        }
    }

    function getClosestReservation() {
        $reservations = $('.booking-table').children();
        var today = new Date();

        if ($reservations.length) {
            for(var i=0; i <$reservations.length; i++) {
                var $info = jQuery($reservations[i]).children();
                var hashKey = new Date(jQuery($info[2]).text());
                var timeString = jQuery($info[3]).text().split(" ");
                var time = (timeString[2] === "PM") ? parseInt(timeString[1].split(":")[0]) + 12 : parseInt(timeString[1].split(":")[0]);

                if (!sortedDateHash.hasOwnProperty(hashKey)) {
                    sortedDateHash[hashKey] = {
                        "time": [],
                        "location": jQuery($info[0]).text() + " - " + jQuery($info[1]).text(),
                        "code": jQuery($info[6]).text()};
                    hashKey.setHours(time);
                    if (hashKey > today) {
                        hashKey.setHours(0);
                        sortedDateKeys.push(hashKey);
                    }
                    hashKey.setHours(0);
                }

                sortedDateHash[hashKey].time.push(time);
            }
            sortedDateKeys.sort(function(a, b) {return a-b});
            sortedDateHash[sortedDateKeys[0]].time.sort(function(a, b) {return a-b});

            var closestDate = new Date(sortedDateKeys[0]);
            closestDate.setHours(sortedDateHash[sortedDateKeys[0]].time[0]);

            var location = sortedDateHash[sortedDateKeys[0]].location;
            var code = sortedDateHash[sortedDateKeys[0]].code;

            return {"date": closestDate, "location": location, "code": code};
        }
        else {
            return {"date": new Date(), "location": null, "code": null};
        }
    }

    function updateInfo(time, location, code) {
        $('#reservation_location').text(location);
        $('#reservation_time').text(time);
        $('#reservation_code').text(code);
    }
});
