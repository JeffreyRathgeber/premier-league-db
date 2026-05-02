function loadPlayers() {
    apiFetch('/players').then(players => {
        const tbody = document.getElementById('players-body');
        tbody.innerHTML = '';
        players.forEach(p => {
            tbody.innerHTML += `
                <tr id="row-${p.player_id}">
                    <td>${p.player_id}</td>
                    <td>${p.first_name}</td>
                    <td>${p.last_name}</td>
                    <td>${p.date_of_birth}</td>
                    <td>${p.age ?? ''}</td>
                    <td>${p.nationality}</td>
                    <td>${p.position}</td>
                    <td>${p.shirt_number}</td>
                    <td>${p.team_id}</td>
                    <td><a href="player_stats.html?player_id=${p.player_id}">Stats</a></td>
                    <td>
                        <button onclick="editPlayer(${p.player_id}, '${p.first_name}', '${p.last_name}', '${p.date_of_birth}', '${p.nationality}', '${p.position}', ${p.shirt_number}, ${p.team_id})">Edit</button>
                        <button onclick="deletePlayer(${p.player_id})">Delete</button>
                    </td>
                </tr>
            `;
        });
    });
}

function editPlayer(id, first_name, last_name, date_of_birth, nationality, position, shirt_number, team_id) {
    const row = document.getElementById(`row-${id}`);
    row.innerHTML = `
        <td>${id}</td>
        <td><input value="${first_name}"></td>
        <td><input value="${last_name}"></td>
        <td><input value="${date_of_birth}"></td>
        <td></td>
        <td><input value="${nationality}"></td>
        <td><input value="${position}"></td>
        <td><input type="number" value="${shirt_number}"></td>
        <td><input type="number" value="${team_id}"></td>
        <td><a href="player_stats.html?player_id=${id}">Stats</a></td>
        <td>
            <button onclick="savePlayer(${id}, this)">Save</button>
            <button onclick="loadPlayers()">Cancel</button>
        </td>
    `;
}

function savePlayer(id, btn) {
    const cells = btn.closest('tr').querySelectorAll('td input');
    const data = {
        first_name: cells[0].value,
        last_name: cells[1].value,
        date_of_birth: cells[2].value,
        nationality: cells[3].value,
        position: cells[4].value,
        shirt_number: parseInt(cells[5].value),
        team_id: parseInt(cells[6].value)
    };

    apiFetch(`/players/${id}`, {
        method: 'PUT',
        body: JSON.stringify(data)
    }).then(() => loadPlayers());
}

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

    apiFetch('/players', {
        method: 'POST',
        body: JSON.stringify(data)
    }).then(() => loadPlayers());
}

function deletePlayer(id) {
    apiFetch(`/players/${id}`, { method: 'DELETE' })
        .then(() => loadPlayers());
}

loadPlayers();
