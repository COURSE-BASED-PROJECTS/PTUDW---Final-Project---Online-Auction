import moment from "moment";

export default function (list){

    for(let i=0;i<list.key.length;i++){
        list.key[i].DateEnd = moment(list.key[i].DateEnd,'YYYY-MM-DD HH:mm:ss').format('DD/MM/YYYY HH:mm');
        list.key[i].DateStart = moment(list.key[i].DateStart,'YYYY-MM-DD HH:mm:ss').format('DD/MM/YYYY HH:mm');
    }

}