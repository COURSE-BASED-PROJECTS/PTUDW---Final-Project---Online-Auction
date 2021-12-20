export default function (t){
    let type;
    if(+t === 1){
        type = "PriceCurrent asc"
    }
    else if(+t === 2){
        type = "PriceCurrent desc"
    }
    else if(+t === 3){
        type = "DateEnd asc"
    }
    else{
        type = "DateEnd desc"
    }

    return type;
}