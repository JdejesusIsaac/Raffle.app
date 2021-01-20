var raffles = [];

function addRaf(raffle) {
    raffles.push(raffle);

}

let generateRandomNum = () => {
    return Math.floor(Math.random() * 100 + 1);

}

let getWinner = () => {
    let winNum = generateRandomNum();
    let closest = 100;
    let currWinner = 0;

    for (var i = 0; i < raffles.length; i++) {
        let diff = Math.abs(raffles[i].value - winNum);
        if (diff < closest) {
            closest = diff;
            currWinner = i;

        }
    }
    return raffles[currWinner];
}