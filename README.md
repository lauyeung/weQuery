weQuery README
===================

weQuery allows you to set up anonymous question asking from your users. Questions can then be upvoted by other users (live at [wequery.herokuapp.com](http://wequery.herokuapp.com/)).

Technical Requirements
-------------------
* Ruby 2.0.0p247
* Rails 4.0.0
* PostgreSQL (<tt>rake db:migrate</tt> to set up the database, run <tt>rake db:test:prepare</tt> to set up the test database)
* Run tests using <tt>rake spec</tt> or <tt>rspec [TEST TO RUN]</tt>

Welcome
===================
![front page](https://lh5.googleusercontent.com/-1GNLCvg2R58/UmW5G1nbMZI/AAAAAAAAAA0/JuekXWCo4jw/w954-h464-no/weQueryfrontpage.png)

Dashboard
===================
![dashboard](https://lh6.googleusercontent.com/-6aP72iKzYkQ/UmW5G3E4tEI/AAAAAAAAAAs/oV_-8YYCU8o/w954-h464-no/weQuerydashboard.png)

ER Diagram
-------------------
![wequery-er-diagram](https://lh5.googleusercontent.com/-0ZoiynL799Q/UmWt3JtJ_GI/AAAAAAAANXk/DoOFzwpbCxY/w386-h305-no/wequery_er_diagram.png)

Next steps
-------------------
* Build out more extensive admin section
* Implement a more real-time solution (e.g. [sync](https://github.com/chrismccord/sync), [pusher](https://github.com/pusher/pusher-gem))
* Keep working on Ember!
