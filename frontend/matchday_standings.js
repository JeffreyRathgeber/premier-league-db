function loadMatchdays() {
    apiFetch('/standings/matchdays').then(matchdays => {
        const select = document.getElementById('matchday-select');
        select.innerHTML = '';
        matchdays.forEach(md => {
            select.innerHTML += `<option value="${md}">Matchday ${md}</option>`;
        });
        if (matchdays.length > 0) {
            loadStandings();
        }
    });
}

function loadStandings() {
    const matchday = document.getElementById('matchday-select').value;
    if (!matchday) return;
    apiFetch(`/standings/matchday/${matchday}`).then(rows => {
        const tbody = document.getElementById('standings-body');
        tbody.innerHTML = '';
        rows.forEach(r => {
            tbody.innerHTML += `
                <tr>
                    <td>${r.position}</td>
                    <td>${r.team_name} (${r.abbreviation ?? ''})</td>
                    <td>${r.played}</td>
                    <td>${r.won}</td>
                    <td>${r.drawn}</td>
                    <td>${r.lost}</td>
                    <td>${r.goals_for}</td>
                    <td>${r.goals_against}</td>
                    <td>${r.goal_difference}</td>
                    <td>${r.points}</td>
                </tr>
            `;
        });
    });
}

loadMatchdays();
