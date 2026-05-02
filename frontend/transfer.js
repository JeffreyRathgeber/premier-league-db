let allTeams = [];

function loadTransferPortal() {
    Promise.all([
        apiFetch('/transfer/players'),
        apiFetch('/teams')
    ]).then(([players, teams]) => {
        allTeams = teams;
        const tbody = document.getElementById('transfer-body');
        tbody.innerHTML = '';
        players.forEach(p => {
            tbody.innerHTML += `
                <tr id="transfer-row-${p.player_id}">
                    <td>${p.player_id}</td>
                    <td>${p.first_name} ${p.last_name}</td>
                    <td>${p.position}</td>
                    <td>${p.shirt_number}</td>
                    <td>${p.team_name || '—'}</td>
                    <td><button onclick="openTransfer(${p.player_id}, ${p.team_id})">Transfer</button></td>
                </tr>
            `;
        });
    });
}

function openTransfer(playerId, currentTeamId) {
    const row = document.getElementById(`transfer-row-${playerId}`);
    const cells = row.querySelectorAll('td');
    const name = cells[1].textContent;
    const position = cells[2].textContent;
    const shirt = cells[3].textContent;
    const currentTeam = cells[4].textContent;

    const options = allTeams
        .filter(t => t.team_id !== currentTeamId)
        .map(t => `<option value="${t.team_id}">${t.name}</option>`)
        .join('');

    row.innerHTML = `
        <td>${playerId}</td>
        <td>${name}</td>
        <td>${position}</td>
        <td>${shirt}</td>
        <td>${currentTeam}</td>
        <td>
            <select id="new-team-${playerId}">${options}</select>
            <button onclick="confirmTransfer(${playerId})">Confirm</button>
            <button onclick="loadTransferPortal()">Cancel</button>
        </td>
    `;
}

function confirmTransfer(playerId) {
    const newTeamId = parseInt(document.getElementById(`new-team-${playerId}`).value);
    apiFetch('/transfer', {
        method: 'POST',
        body: JSON.stringify({ player_id: playerId, new_team_id: newTeamId })
    }).then(() => loadTransferPortal());
}

loadTransferPortal();
