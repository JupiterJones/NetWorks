as yet unclassified
renderCreateForm: html
  | id startTime endTime |
  html form
    id: 'event-details';
    with: [ 
          html div
            with: [ 
              html label
                for: (id := html nextId);
                with: 'Start Time'.
              html select
                id: id;
                list: self timeList;
                selected: event start asTime;
                callback: [ :val | startTime := val ].
              html hiddenInput
                callback: [ 
                  event
                    start:
                      (DateAndTime
                        year: event start year
                        day: event start dayOfYear
                        hour: startTime hour
                        minute: startTime minute
                        second: startTime seconds) ] ].
          html div
            id: 'endtime';
            with: [ 
                  html label
                    for: (id := html nextId);
                    with: 'End Time'.
                  html select
                    id: id;
                    list: self timeList;
                    selected: (event end + 1 nanoSecond) asTime;
                    callback: [ :val | endTime := val ].
                  html hiddenInput
                    callback: [ 
                      event
                        end:
                          (DateAndTime
                            year: event end year
                            day: event end dayOfYear
                            hour: endTime hour
                            minute: endTime minute
                            second: endTime seconds) ] ].
          html div
            with: [ 
              html label
                for: (id := html nextId);
                with: 'Title'.
              html textInput
                id: id;
                on: #'title' of: event ].
          html hiddenInput callback: [ self saveNew ] ]