$('body').hide();

let resName = '';

window.addEventListener('message', (event) => {
    if (event.data.type === "bike_ui") {
        document.getElementById("main").innerHTML = "";

        if (event.data.status) {
            $('body').fadeIn();
            $('#spinner').hide();
            $('#main').show();

            resName = event.data.resName;

            event.data.bikes.forEach(bike => {
                document.getElementById("main").innerHTML +=`
                    <div class="bike" onCLick="buy('${bike.model}', ${bike.price})">
                            <img src="./assets/img/${bike.imageName}" alt="Avatar" class="image">
                            <div class="blackBG"></div>
                        <div class="middle">
                            <p class="title">${bike.name}</p>
                            <p class="price">${bike.price} <span class="currency">${event.data.currency}</span></p>
                        </div>
                    </div>
                `;
            });
        } else {
            $('body').fadeOut();
        }
    }
});

document.getElementById("closeBTN").addEventListener("click", () => {
    $.post(`http://${resName}/close`, JSON.stringify({}));
});

const buy = (model, price) => {
    $('#spinner').fadeIn();

    setTimeout(() => {
        $('#spinner').hide();
        $('#main').hide();
        $.post(`http://${resName}/buy`, JSON.stringify({ model, price }));
    }, 1500);
}