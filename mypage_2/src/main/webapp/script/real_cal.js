today = new Date();
year = today.getFullYear();
month = today.getMonth() + 1;

thisYearMonth = "";
thisYearMonth = year;
thisYearMonth += "-";
thisYearMonth += month;
console.log(thisYearMonth);

var draggedEventIsAllDay;
var activeInactiveWeekends = true;

var calendar = $('#calendar').fullCalendar({

    /** ******************
      *  OPTIONS
      * *******************/
     locale                    : 'ko',    
     timezone                  : "local", 
     nextDayThreshold          : "09:00:00",
     allDaySlot                : true,
     displayEventTime          : true,
     displayEventEnd           : true,
     firstDay                  : 0, //월요일이 먼저 오게 하려면 1
     weekNumbers               : false,
     selectable                : true,
     weekNumberCalculation     : "ISO",
     eventLimit                : true,
     views                     : { 
                                   month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
                                 },
     eventLimitClick           : 'week', //popover
     navLinks                  : true,
     defaultDate               : moment('2019-05'), //실제 사용시 현재 날짜로 수정
     timeFormat                : 'HH:mm',
     defaultTimedEventDuration : '01:00:00',
     editable                  : true,
     minTime                   : '00:00:00',
     maxTime                   : '24:00:00',
     slotLabelFormat           : 'HH:mm',
     weekends                  : true,
     nowIndicator              : true,
     dayPopoverFormat          : 'MM/DD dddd',
     longPressDelay            : 0,
     eventLongPressDelay       : 0,
     selectLongPressDelay      : 0,  
     header                    : {
                                   left   : 'today, prevYear, nextYear, viewWeekends',
                                   center : 'prev, title, next',
                                   right  : 'month, agendaWeek, agendaDay, listWeek'
                                 },
     views                     : {
                                   month : {
                                     columnFormat : 'dddd'
                                   },
                                   agendaWeek : {
                                     columnFormat : 'M/D ddd',
                                     titleFormat  : 'YYYY년 M월 D일',
                                     eventLimit   : false
                                   },
                                   agendaDay : {
                                     columnFormat : 'dddd',
                                     eventLimit   : false
                                   },
                                   listWeek : {
                                     columnFormat : ''
                                   }
                                 },
     customButtons             : { //주말 숨기기 & 보이기 버튼
                                   viewWeekends : {
                                     text  : '주말',
                                     click : function () {
                                       activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                                       $('#calendar').fullCalendar('option', { 
                                         weekends: activeInactiveWeekends
                                       });
                                     }
                                   }
                                  },


     eventRender: function (event, element, view) {

       //일정에 hover시 요약
       element.popover({
         title: $('<div />', {
           class: 'popoverTitleCalendar',
           text: event.title
         }).css({
           'background': event.backgroundColor,
           'color': event.textColor
         }),
         content: $('<div />', {
             class: 'popoverInfoCalendar'
           }).append('<p><strong>등록자:</strong> ' + event.username + '</p>')
           .append('<p><strong>구분:</strong> ' + event.type + '</p>')
           .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
           .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
         delay: {
           show: "800",
           hide: "50"
         },
         trigger: 'hover',
         placement: 'top',
         html: true,
         container: 'body'
       });

       return filtering(event);

     },

     /* ****************
      *  일정 받아옴 
      * ************** */
     events: function (start, end, timezone, callback) {
       $.ajax({
         type: "get",
         url: "data.json",
         data: {
           // 화면이 바뀌면 Date 객체인 start, end 가 들어옴
           //startDate : moment(start).format('YYYY-MM-DD'),
           //endDate   : moment(end).format('YYYY-MM-DD')
         },
         success: function (response) {
           var fixedDate = response.map(function (array) {
             if (array.allDay && array.start !== array.end) {
               array.end = moment(array.end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
             }
             return array;
           });
           callback(fixedDate);
         }
       });
     },

     eventAfterAllRender: function (view) {
       if (view.name == "month") $(".fc-content").css('height', 'auto');
     },

     //일정 리사이즈
     eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
       $('.popover.fade.top').remove();

       /** 리사이즈시 수정된 날짜반영
        * 하루를 빼야 정상적으로 반영됨. */
       var newDates = calDateWhenResize(event);

       //리사이즈한 일정 업데이트
       $.ajax({
         type: "get",
         url: "",
         data: {
           //id: event._id,
           //....
         },
         success: function (response) {
           alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
         }
       });

     },

     eventDragStart: function (event, jsEvent, ui, view) {
       draggedEventIsAllDay = event.allDay;
     },

     //일정 드래그앤드롭
     eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
       $('.popover.fade.top').remove();

       //주,일 view일때 종일 <-> 시간 변경불가
       if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
         if (draggedEventIsAllDay !== event.allDay) {
           alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
           location.reload();
           return false;
         }
       }

       // 드랍시 수정된 날짜반영
       var newDates = calDateWhenDragnDrop(event);

       //드롭한 일정 업데이트
       $.ajax({
         type: "get",
         url: "",
         data: {
           //...
         },
         success: function (response) {
           alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
         }
       });

     },

     select: function (startDate, endDate, jsEvent, view) {

       $(".fc-body").unbind('click');
       $(".fc-body").on('click', 'td', function (e) {

         $("#contextMenu")
           .addClass("contextOpened")
           .css({
             display: "block",
             left: e.pageX,
             top: e.pageY
           });
         return false;
       });

       var today = moment();

       if (view.name == "month") {
         startDate.set({
           hours: today.hours(),
           minute: today.minutes()
         });
         startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
         endDate = moment(endDate).subtract(1, 'days');

         endDate.set({
           hours: today.hours() + 1,
           minute: today.minutes()
         });
         endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
       } else {
         startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
         endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
       }

       //날짜 클릭시 카테고리 선택메뉴
       var $contextMenu = $("#contextMenu");
       $contextMenu.on("click", "a", function (e) {
         e.preventDefault();

         //닫기 버튼이 아닐때
         if ($(this).data().role !== 'close') {
           newEvent(startDate, endDate, $(this).html());
         }

         $contextMenu.removeClass("contextOpened");
         $contextMenu.hide();
       });

       $('body').on('click', function () {
         $contextMenu.removeClass("contextOpened");
         $contextMenu.hide();
       });

     },

     //이벤트 클릭시 수정이벤트
     eventClick: function (event, jsEvent, view) {
       editEvent(event);
     }

   });


// $(document).ready(function () {

//     /* initialize the external events
//     -----------------------------------------------------------------*/

//     var containerEl = document.getElementById('external-events-list');
//     new FullCalendar.Draggable(containerEl, {
//         itemSelector: '.fc-event',
//         eventData: function (eventEl) {
//             return {
//                 title: eventEl.innerText.trim()
//             }
//         }
//     });

//     //// the individual way to do it
//     // var containerEl = document.getElementById('external-events-list');
//     // var eventEls = Array.prototype.slice.call(
//     //   containerEl.querySelectorAll('.fc-event')
//     // );
//     // eventEls.forEach(function(eventEl) {
//     //   new FullCalendar.Draggable(eventEl, {
//     //     eventData: {
//     //       title: eventEl.innerText.trim(),
//     //     }
//     //   });
//     // });

//     /* initialize the calendar
//     -----------------------------------------------------------------*/

//     var calendarEl = document.getElementById('calendar');
//     var calendar = new FullCalendar.Calendar(calendarEl, {
//         headerToolbar: {
//             left: 'prev,next today',
//             center: 'title',
//             right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
//         },
//         editable: true,
//         droppable: true, // this allows things to be dropped onto the calendar
//         drop: function (arg) {
//             // is the "remove after drop" checkbox checked?
//             if (document.getElementById('drop-remove').checked) {
//                 // if so, remove the element from the "Draggable Events" list
//                 arg.draggedEl.parentNode.removeChild(arg.draggedEl);
//             }
//         },
//         locale:'ko'
//     });
//     calendar.render();

//     // $(document).ready(function () {
//     //     var calendarEl = document.getElementById('calendar');
//     //     var calendar = new FullCalendar.Calendar(calendarEl, {
//     //         initialView: 'dayGridMonth',
//     //         //언어설정
//     //         locale: 'ko'
//     //     });
//     //     calendar.render();
//     // })
// });