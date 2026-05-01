function loadTopScorers() {
    apiFetch('/top-scorers').then(rows => {
        const tbody = document.getElementById('top-scorers-body');
        tbody.innerHTML = '';
        rows.forEach((r, i) => {
            tbody.innerHTML += `
                <tr>
                    <td>${i + 1}</td>
                    <td>${r.player_id}</td>
                    <td>${r.first_name}</td>
                    <td>${r.last_name}</td>
                    <td>${r.position ?? ''}</td>
                    <td>${r.shirt_number ?? ''}</td>
                    <td>${r.team_name ?? ''}</td>
                    <td>${r.goals}</td>
                </tr>
            `;
        });
    });
}

loadTopScorers();
