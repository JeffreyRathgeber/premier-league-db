function loadManagerPerformance() {
    apiFetch('/manager-performance').then(rows => {
        const tbody = document.getElementById('manager-performance-body');
        tbody.innerHTML = '';
        rows.forEach(r => {
            tbody.innerHTML += `
                <tr>
                    <td>${r.first_name} ${r.last_name}</td>
                    <td>${r.nationality ?? ''}</td>
                    <td>${r.team}</td>
                    <td>${r.matches}</td>
                    <td>${r.wins}</td>
                    <td>${r.draws}</td>
                    <td>${r.losses}</td>
                    <td>${r.points}</td>
                    <td>${r.win_rate_pct}%</td>
                </tr>
            `;
        });
    });
}

loadManagerPerformance();
