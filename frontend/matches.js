loadMatchdays();

function loadMatchdays() {
    apiFetch('/matches/matchdays').then(matchdays => {
        const select = document.getElementById('matchday-select');
        const current = select.value;
        select.innerHTML = '<option value="">-- Select a matchday --</option>';
        matchdays.forEach(md => {
            const opt = document.createElement('option');
            opt.value = md;
            opt.textContent = `Matchday ${md}`;
            select.appendChild(opt);
        });
        if (current && matchdays.includes(parseInt(current))) {
            select.value = current;
            loadMatchday();
        }
    });
}

function loadMatchday() {
    const matchday = document.getElementById('matchday-select').value;
    const container = document.getElementById('matches-container');
    if (!matchday) { container.innerHTML = ''; return; }

    apiFetch(`/matches?matchday=${matchday}`).then(matches => {
        if (matches.length === 0) {
            container.innerHTML = '<p>No matches for this matchday.</p>';
            return;
        }
        container.innerHTML = `
            <table border="1" cellpadding="8">
                <thead>
                    <tr><th>Kickoff</th><th>Match</th><th>Score</th></tr>
                </thead>
                <tbody>
                    ${matches.map(m => `
                        <tr>
                            <td>${m.kickoff_time}</td>
                            <td><a href="match.html?match_id=${m.match_id}">${m.home_team_name} vs ${m.away_team_name}</a></td>
                            <td>${m.home_score} – ${m.away_score}</td>
                        </tr>
                    `).join('')}
                </tbody>
            </table>
        `;
    });
}

function addMatch() {
    const data = {
        matchday:     parseInt(document.getElementById('new_matchday').value),
        match_date:   document.getElementById('new_match_date').value,
        kickoff_time: document.getElementById('new_kickoff_time').value,
        home_team_id: parseInt(document.getElementById('new_home_team_id').value),
        away_team_id: parseInt(document.getElementById('new_away_team_id').value),
        home_score:   parseInt(document.getElementById('new_home_score').value) || 0,
        away_score:   parseInt(document.getElementById('new_away_score').value) || 0,
        referee_id:   parseInt(document.getElementById('new_referee_id').value),
        attendance:   parseInt(document.getElementById('new_attendance').value) || 0
    };

    if (!data.matchday || !data.match_date || !data.home_team_id || !data.away_team_id || !data.referee_id) {
        alert('Please fill in matchday, date, home team, away team, and referee.');
        return;
    }

    apiFetch('/matches', { method: 'POST', body: JSON.stringify(data) }).then(() => {
        ['matchday','match_date','kickoff_time','home_team_id','away_team_id','home_score','away_score','referee_id','attendance']
            .forEach(f => document.getElementById(`new_${f}`).value = '');
        loadMatchdays();
        const select = document.getElementById('matchday-select');
        select.value = data.matchday;
        loadMatchday();
    });
}
