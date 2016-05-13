function Square(square,game) {
  this.game = game;
  this.element = $('<div class="ticSquare"></div>');
  this.element.attr('magicValue',square);
  $(this.element).on('click', function() {

    if (game.whatTurnNumber() % 2 === 0){
      $(this).html("X");
    }else{
      $(this).html("O");
    }
    game.incrementGameTurn();
});
}

function Player(num){
  this.playerNum = num;
  this.score = 0;
}
Player.prototype.increaseScore = function (amount) {
  this.score =+ amount;
};
Player.prototype.winner = function () {
  if (this.score = 15){
      return true;}
    else {
      return false;
    }
};

function Game(){
  var magicSquare = [2,7,9,9,5,1,4,3,8]
  this.gameTurn =0;
  var playerX = new Player(1);
  var playerY = new Player(2);
  for (square = 0; square < magicSquare.length; square++){
    ticSquare = new Square(magicSquare[square],this);
    $('#game').append(ticSquare.element);
  }
}
Game.prototype.whatTurnNumber = function () {
    return this.gameTurn;
};
Game.prototype.incrementGameTurn = function () {
  this.gameTurn++
};


$(document).on('ready', function(){
  ticGame = new Game();
});
