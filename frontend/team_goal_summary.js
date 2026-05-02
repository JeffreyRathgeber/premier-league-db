function loadTeamGoalSummary() {
    apiFetch('/team-goal-summary').then(rows => {
        const tbody = document.getElementById('team-goal-summary-body');
        tbody.innerHTML = '';
        rows.forEach(r => {
            const gd = r.goal_difference > 0 ? `+${r.goal_difference}` : r.goal_difference;
            tbody.innerHTML += `
                <tr>
                    <td>${r.team}</td>
                    <td>${r.matches_played}</td>
                    <td>${r.goals_scored}</td>
                    <td>${r.goals_conceded}</td>
                    <td>${gd}</td>
                </tr>
            `;
        });
    });
}

loadTeamGoalSummary();
