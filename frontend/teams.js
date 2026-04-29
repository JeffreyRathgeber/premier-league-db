function loadTeams() {
    apiFetch('/teams').then(teams => {
        const tbody = document.getElementById('teams-body');
        tbody.innerHTML = '';
        teams.forEach(t => {
            tbody.innerHTML += `
                <tr id="row-${t.team_id}">
                    <td>${t.team_id}</td>
                    <td>${t.name}</td>
                    <td>${t.abbreviation}</td>
                    <td>${t.stadium}</td>
                    <td>${t.city}</td>
                    <td>${t.founded_year}</td>
                    <td>${t.manager_id}</td>
                    <td><a href="team_stats.html?team_id=${t.team_id}">Stats</a></td>
                    <td><a href="standings.html?team_id=${t.team_id}">Standings</a></td>
                    <td>
                        <button onclick="editTeam(${t.team_id}, '${t.name}', '${t.abbreviation}', '${t.stadium}', '${t.city}', ${t.founded_year}, ${t.manager_id})">Edit</button>
                        <button onclick="deleteTeam(${t.team_id})">Delete</button>
                    </td>
                </tr>
            `;
        });
    });
}

function editTeam(id, name, abbreviation, stadium, city, founded_year, manager_id) {
    const row = document.getElementById(`row-${id}`);
    row.innerHTML = `
        <td>${id}</td>
        <td><input value="${name}"></td>
        <td><input value="${abbreviation}"></td>
        <td><input value="${stadium}"></td>
        <td><input value="${city}"></td>
        <td><input type="number" value="${founded_year}"></td>
        <td><input type="number" value="${manager_id}"></td>
        <td><a href="team_stats.html?team_id=${id}">Stats</a></td>
        <td><a href="standings.html?team_id=${id}">Standings</a></td>
        <td>
            <button onclick="saveTeam(${id}, this)">Save</button>
            <button onclick="loadTeams()">Cancel</button>
        </td>
    `;
}

function saveTeam(id, btn) {
    const cells = btn.closest('tr').querySelectorAll('td input');
    const data = {
        name: cells[0].value,
        abbreviation: cells[1].value,
        stadium: cells[2].value,
        city: cells[3].value,
        founded_year: parseInt(cells[4].value),
        manager_id: parseInt(cells[5].value)
    };

    apiFetch(`/teams/${id}`, {
        method: 'PUT',
        body: JSON.stringify(data)
    }).then(() => loadTeams());
}

function createTeam() {
    const data = {
        name: document.getElementById('name').value,
        abbreviation: document.getElementById('abbreviation').value,
        stadium: document.getElementById('stadium').value,
        city: document.getElementById('city').value,
        founded_year: parseInt(document.getElementById('founded_year').value),
        manager_id: parseInt(document.getElementById('manager_id').value)
    };

    apiFetch('/teams', {
        method: 'POST',
        body: JSON.stringify(data)
    }).then(() => loadTeams());
}

function deleteTeam(id) {
    apiFetch(`/teams/${id}`, { method: 'DELETE' })
        .then(() => loadTeams());
}

loadTeams();
