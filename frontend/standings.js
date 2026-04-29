const params = new URLSearchParams(window.location.search);
const teamId = params.get('team_id');
let allStandings = [];

if (!teamId) {
    document.getElementById('standings-container').innerHTML = '<p>No team specified.</p>';
} else {
    apiFetch(`/teams/${teamId}`)
        .then(team => {
            document.getElementById('page-title').textContent = `${team.name} — Standings`;
        })
        .catch(() => {});

    loadMatchdays();
}

function loadMatchdays() {
    apiFetch(`/teams/${teamId}/standings`).then(rows => {
        allStandings = rows;
        const select = document.getElementById('matchday-select');
        const current = select.value;
        select.innerHTML = '<option value="">-- Select a matchday --</option>';
        rows.forEach(r => {
            const opt = document.createElement('option');
            opt.value = r.matchday;
            opt.textContent = `Matchday ${r.matchday}`;
            select.appendChild(opt);
        });
        if (current && rows.find(r => r.matchday == current)) {
            select.value = current;
            renderStanding(rows.find(r => r.matchday == current));
        } else {
            document.getElementById('standings-container').innerHTML = '';
        }
    });
}

function onMatchdayChange() {
    const matchday = document.getElementById('matchday-select').value;
    if (!matchday) {
        document.getElementById('standings-container').innerHTML = '';
        return;
    }
    const row = allStandings.find(r => r.matchday == matchday);
    if (row) renderStanding(row);
}

function renderStanding(s) {
    document.getElementById('standings-container').innerHTML = `
        <table border="1" cellpadding="8">
            <thead>
                <tr>
                    <th>Matchday</th><th>Played</th><th>Won</th><th>Drawn</th><th>Lost</th>
                    <th>GF</th><th>GA</th><th>GD</th><th>Points</th><th>Position</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr id="standing-row">
                    <td>${s.matchday}</td>
                    <td>${s.played}</td><td>${s.won}</td><td>${s.drawn}</td><td>${s.lost}</td>
                    <td>${s.goals_for}</td><td>${s.goals_against}</td><td>${s.goal_difference}</td>
                    <td>${s.points}</td><td>${s.position}</td>
                    <td><button onclick="editStanding(${s.matchday}, ${s.played}, ${s.won}, ${s.drawn}, ${s.lost}, ${s.goals_for}, ${s.goals_against}, ${s.goal_difference}, ${s.points}, ${s.position})">Edit</button></td>
                </tr>
            </tbody>
        </table>
    `;
}

function editStanding(matchday, played, won, drawn, lost, goals_for, goals_against, goal_difference, points, position) {
    document.getElementById('standing-row').innerHTML = `
        <td>${matchday}</td>
        <td><input type="number" value="${played}"></td>
        <td><input type="number" value="${won}"></td>
        <td><input type="number" value="${drawn}"></td>
        <td><input type="number" value="${lost}"></td>
        <td><input type="number" value="${goals_for}"></td>
        <td><input type="number" value="${goals_against}"></td>
        <td><input type="number" value="${goal_difference}"></td>
        <td><input type="number" value="${points}"></td>
        <td><input type="number" value="${position}"></td>
        <td>
            <button onclick="saveStanding(${matchday}, this)">Save</button>
            <button onclick="onMatchdayChange()">Cancel</button>
        </td>
    `;
}

function saveStanding(matchday, btn) {
    const inputs = btn.closest('tr').querySelectorAll('input');
    const data = {
        played: parseInt(inputs[0].value),
        won: parseInt(inputs[1].value),
        drawn: parseInt(inputs[2].value),
        lost: parseInt(inputs[3].value),
        goals_for: parseInt(inputs[4].value),
        goals_against: parseInt(inputs[5].value),
        goal_difference: parseInt(inputs[6].value),
        points: parseInt(inputs[7].value),
        position: parseInt(inputs[8].value)
    };

    apiFetch(`/teams/${teamId}/standings/${matchday}`, {
        method: 'PUT',
        body: JSON.stringify(data)
    }).then(() => loadMatchdays());
}

function addMatchday() {
    const data = {
        matchday: parseInt(document.getElementById('new_matchday').value),
        played: parseInt(document.getElementById('new_played').value) || 0,
        won: parseInt(document.getElementById('new_won').value) || 0,
        drawn: parseInt(document.getElementById('new_drawn').value) || 0,
        lost: parseInt(document.getElementById('new_lost').value) || 0,
        goals_for: parseInt(document.getElementById('new_goals_for').value) || 0,
        goals_against: parseInt(document.getElementById('new_goals_against').value) || 0,
        goal_difference: parseInt(document.getElementById('new_goal_difference').value) || 0,
        points: parseInt(document.getElementById('new_points').value) || 0,
        position: parseInt(document.getElementById('new_position').value) || 0
    };

    if (!data.matchday) { alert('Please enter a matchday number.'); return; }

    apiFetch(`/teams/${teamId}/standings`, {
        method: 'POST',
        body: JSON.stringify(data)
    }).then(() => {
        ['matchday','played','won','drawn','lost','goals_for','goals_against','goal_difference','points','position']
            .forEach(id => document.getElementById(`new_${id}`).value = '');
        loadMatchdays();
    });
}

function deleteMatchday() {
    const matchday = document.getElementById('matchday-select').value;
    if (!matchday) { alert('Select a matchday first.'); return; }

    apiFetch(`/teams/${teamId}/standings/${matchday}`, { method: 'DELETE' })
        .then(() => loadMatchdays());
}
