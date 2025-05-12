window.addEventListener('message', (event) => {
    const e = event.data;

    switch(e.action) {
        case 'show': 
            $('.container').fadeIn(250); 

            $('#weapon-select').empty();

            $.each(e.data, function(weaponName, weaponData) {
                $('#weapon-select').append(`
                    <option value="${weaponName}">${weaponData.label}</option>
                `);
            });
        break;


    }
});

function searchPlayer() {
    const playerId = $('#player-id').val();

    if (!playerId) {
       return;
    }

    $.post('https://Perri-VipWeapons/searchPlayer', JSON.stringify({
       playerId: parseInt(playerId)
    }), function(response) {
        if (!response.weapons || response.weapons.length === 0) {
            $('.weapon-list-section').html('<p>No weapons found for this player.</p>');
            return;
        }

        $('.weapon-list-section').empty();
        
        $.each(response.weapons, function(_, weaponName) {
            $('.weapon-list-section').append(`
                <div class="weapon-card">
                    <div id="wn ${weaponName}">${weaponName}</div>
                    <button onclick="removeWeapon('${weaponName}')" class="remove">Remove</button>
                </div>
            `);
        });
    });
}

function giveWeapon() {
    const weapon = $('#weapon-select').val();
    const playerId = $('#playerId').val();

    if (!playerId || !weapon) {
       return;
    }

    $.post('https://Perri-VipWeapons/giveWeapon', JSON.stringify({
       playerId: parseInt(playerId),
       weapon: weapon
    }), function(response) {
        searchPlayer(); 
    });
}

function removeWeapon(weaponName) {
    const playerId = $('#player-id').val();

    if (!playerId || !weaponName) {
        return;
    }

    $.post('https://Perri-VipWeapons/removeWeapon', JSON.stringify({
        playerId: parseInt(playerId),
        weapon: weaponName
    }), function(response) {
        searchPlayer(); 
    });
}

function closeAll() {
    $('.container').fadeOut(50);
    $.post(`https://Perri-VipWeapons/exit`);
}

$(document).keyup((e) => {
    if (e.key === 'Escape') {
        closeAll();
    }
});
