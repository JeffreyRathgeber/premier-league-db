const API = 'http://127.0.0.1:5000';

// Display players
function loadPlayers() {
    fetch(`${API}/players`)
        .then(res => res.json())
        .then(players => {
            const tbody = document.getElementById('players-body');
            tbody.innerHTML = '';
            players.forEach(p => {
                tbody.innerHTML += `
                    <tr>
                        <td>${p.player_id}</td>
                        <td>${p.first_name}</td>
                        <td>${p.last_name}</td>
                        <td>${p.date_of_birth}</td>
                        <td>${p.nationality}</td>
                        <td>${p.position}</td>
                        <td>${p.shirt_number}</td>
                        <td>${p.team_id}</td>
                        <td><button onclick="deletePlayer(${p.player_id})">Delete</button></td>
                    </tr>
                `;
            });
        });
}

// Create player
function createPlayer() {
    const data = {
        first_name: document.getElementById('first_name').value,
        last_name: document.getElementById('last_name').value,
        date_of_birth: document.getElementById('date_of_birth').value,
        nationality: document.getElementById('nationality').value,
        position: document.getElementById('position').value,
        shirt_number: parseInt(document.getElementById('shirt_number').value),
        team_id: parseInt(document.getElementById('team_id').value)
    };

    fetch(`${API}/players`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data)
    }).then(() => loadPlayers());
}

// Update player
function updatePlayer() {
    const id = document.getElementById('update_id').value;
    const data = {
        first_name: document.getElementById('update_first_name').value,
        last_name: document.getElementById('update_last_name').value,
        date_of_birth: document.getElementById('update_date_of_birth').value,
        nationality: document.getElementById('update_nationality').value,
        position: document.getElementById('update_position').value,
        shirt_number: parseInt(document.getElementById('update_shirt_number').value),
        team_id: parseInt(document.getElementById('update_team_id').value)
    };

    fetch(`${API}/players/${id}`, {
        method: 'PUT',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data)
    }).then(() => loadPlayers());
}

// Delete player
function deletePlayer(id) {
    fetch(`${API}/players/${id}`, { method: 'DELETE' })
        .then(() => loadPlayers());
}


loadPlayers();