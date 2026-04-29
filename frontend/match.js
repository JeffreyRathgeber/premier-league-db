const params = new URLSearchParams(window.location.search);
const matchId = params.get('match_id');

if (!matchId) {
    document.getElementById('match-container').innerHTML = '<p>No match specified.</p>';
} else {
    loadMatch();
}

function loadMatch() {
    apiFetch(`/matches/${matchId}`).then(m => {
        document.getElementById('page-title').textContent =
            `${m.home_team_name} vs ${m.away_team_name} — Matchday ${m.matchday}`;

        document.getElementById('match-container').innerHTML = `
            <table border="1" cellpadding="8">
                <thead>
                    <tr>
                        <th>Match ID</th><th>Matchday</th><th>Date</th><th>Kickoff</th>
                        <th>Home Team ID</th><th>Away Team ID</th>
                        <th>Home Score</th><th>Away Score</th>
                        <th>Referee ID</th><th>Attendance</th><th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="match-row">
                        <td>${m.match_id}</td>
                        <td>${m.matchday}</td>
                        <td>${m.match_date}</td>
                        <td>${m.kickoff_time}</td>
                        <td>${m.home_team_id} (${m.home_team_name})</td>
                        <td>${m.away_team_id} (${m.away_team_name})</td>
                        <td>${m.home_score}</td>
                        <td>${m.away_score}</td>
                        <td>${m.referee_id} (${m.referee_name})</td>
                        <td>${m.attendance}</td>
                        <td>
                            <button onclick="editMatch(${m.matchday},'${m.match_date}','${m.kickoff_time}',${m.home_team_id},${m.away_team_id},${m.home_score},${m.away_score},${m.referee_id},${m.attendance})">Edit</button>
                            <button onclick="deleteMatch()">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        `;
    });
}

function editMatch(matchday, match_date, kickoff_time, home_team_id, away_team_id, home_score, away_score, referee_id, attendance) {
    document.getElementById('match-row').innerHTML = `
        <td>${matchId}</td>
        <td><input type="number" value="${matchday}"></td>
        <td><input value="${match_date}"></td>
        <td><input value="${kickoff_time}"></td>
        <td><input type="number" value="${home_team_id}"></td>
        <td><input type="number" value="${away_team_id}"></td>
        <td><input type="number" value="${home_score}"></td>
        <td><input type="number" value="${away_score}"></td>
        <td><input type="number" value="${referee_id}"></td>
        <td><input type="number" value="${attendance}"></td>
        <td>
            <button onclick="saveMatch(this)">Save</button>
            <button onclick="loadMatch()">Cancel</button>
        </td>
    `;
}

function saveMatch(btn) {
    const inputs = btn.closest('tr').querySelectorAll('input');
    const data = {
        matchday:     parseInt(inputs[0].value),
        match_date:   inputs[1].value,
        kickoff_time: inputs[2].value,
        home_team_id: parseInt(inputs[3].value),
        away_team_id: parseInt(inputs[4].value),
        home_score:   parseInt(inputs[5].value),
        away_score:   parseInt(inputs[6].value),
        referee_id:   parseInt(inputs[7].value),
        attendance:   parseInt(inputs[8].value)
    };

    apiFetch(`/matches/${matchId}`, { method: 'PUT', body: JSON.stringify(data) })
        .then(() => loadMatch());
}

function deleteMatch() {
    apiFetch(`/matches/${matchId}`, { method: 'DELETE' }).then(() => {
        window.location.href = 'matches.html';
    });
}
