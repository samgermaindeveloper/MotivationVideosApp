var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.all('/*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-Width");
    res.header("Access-Control-Allow-Methods", "POST", "GET");
    next();
});

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}));

var tutorials = [
    {
        id: 1,
        title: "It's ok to be Youself",
        desc: "Minasan Konichiwa! It’s me Tofu Chan I believe in you!",
        iframe: '<div class="container"><iframe class="Video" src="https://www.youtube.com/embed/RahYj4xs_dU" frameborder="0" allowFullScreen></iframe></div>',
        thumbnailUrl: "https://i.ytimg.com/vi/RahYj4xs_dU/maxresdefault.jpg"
    },
    {
        id: 2,
        title: "The secret to smiles",
        desc: "😊 I'm doing a smile for you 😊",
        iframe: '<div class="container"><iframe class="Video" src="https://www.youtube.com/embed/pMFDBA2rKTI" frameborder="0" allowFullScreen></iframe></div>',
        thumbnailUrl: "https://i.ytimg.com/vi/pMFDBA2rKTI/maxresdefault.jpg"
    },
    {
        id: 3,
        title: "You can do it",
        desc: "💪🏻I believe in you 💪🏻",
        iframe: '<div class="container"><iframe class="Video" src="https://www.youtube.com/embed/kRpODt0rflA" frameborder="0" allowFullScreen></iframe></div>',
        thumbnailUrl: "https://i.ytimg.com/vi/kRpODt0rflA/maxresdefault.jpg"
    },
    {
        id: 4,
        title: "Motivation Time w/ Tofu: Episode 1",
        desc: "Let's Motivating!",
        iframe: '<div class="container"><iframe class="Video" src="https://www.youtube.com/embed/Cw_f4OgW0vQ" frameborder="0" allowFullScreen></iframe></div>',
        thumbnailUrl: "https://i.ytimg.com/vi/Cw_f4OgW0vQ/maxresdefault.jpg"
    }

];

var comments1 = [
    {
        user: "Sam",
        comment: "First Comment"
    },
    {
        user: "Kailee",
        comment: "Second Comment"
    }
]

var comments2 = [
    {
        user: "Sam",
        comment: "Third Comment"
    }
]

var comments3 = [
    {
        user: "Sam",
        comment: "Fourth Comment"
    }
]

var comments4 = [
    {
        user: "Sam",
        comment: "Fifth Comment"
    }
]

app.post('/comments/1', function(res, req) {
    var comment = req.req.body;
    if (comment) {
        if (comment.user && comment.comment){
            comments1.push(comment);
            res.res.send("All good");
        }else{
            res.res.send("You posted invalid data");
        }
    }else{
        res.res.send("Your post has no body")
    }
})

app.post('/comments/2', function(res, req) {
    var comment = req.req.body;
    if (comment) {
        if (comment.user && comment.comment){
            comments2.push(comment);
        }else{
            res.res.send("You posted invalid data");
        }
    }else{
        res.res.send("Your post has no body")
    }
})

app.post('/comments/3', function(res, req) {
    var comment = req.req.body;
    if (comment) {
        if (comment.user && comment.comment){
            comments3.push(comment);
        }else{
            res.res.send("You posted invalid data");
        }
    }else{
        res.res.send("Your post has no body")
    }
})

app.post('/comments/4', function(res, req) {
    var comment = req.req.body;
    if (comment) {
        if (comment.user && comment.comment){
            comments4.push(comment);
        }else{
            res.res.send("You posted invalid data");
        }
    }else{
        res.res.send("Your post has no body")
    }
})

app.get('/tutorials', function(req,res) {
    console.log("GET from server");
    res.send(tutorials);
});

app.get('/comments/1', function(req,res) {
    console.log("GET from server");
    res.send(comments1);
});

app.get('/comments/2', function(req,res) {
    console.log("GET from server");
    res.send(comments2);
});

app.get('/comments/3', function(req,res) {
    console.log("GET from server");
    res.send(comments3);
});

app.get('/comments/4', function(req,res) {
    console.log("GET from server");
    res.send(comments4);
});

app.listen(6060)