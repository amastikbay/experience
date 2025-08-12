-- queries.sql
-- Genius Sports - Analytics for FC Venezia and FC Palermo Corner Kick Analysis

-- 1. Total number of corner kicks by delivery_type and delivery_zone per team for current season
SELECT 
    c.team_id,
    t.team_name,
    c.delivery_type,
    c.delivery_zone,
    COUNT(*) AS corner_count
FROM corners_analysis c
JOIN teams t ON c.team_id = t.team_id
WHERE c.match_id IN (
    SELECT match_id FROM matches WHERE date >= '2023-08-01' AND date <= '2024-05-31'
)
AND t.team_name IN ('Venezia', 'Palermo')
GROUP BY c.team_id, t.team_name, c.delivery_type, c.delivery_zone
ORDER BY c.team_id, c.delivery_type, c.delivery_zone;


-- 2. Conversion rate of corners to shots on target and goals by delivery_type for FC Venezia
WITH corners_v AS (
    SELECT 
        corner_id,
        delivery_type,
        CASE WHEN shot_outcome IN ('goal', 'shot_on_target') THEN 1 ELSE 0 END AS is_scoring_opportunity
    FROM corners_analysis
    WHERE team_id = (SELECT team_id FROM teams WHERE team_name = 'Venezia')
)
SELECT
    delivery_type,
    COUNT(corner_id) AS total_corners,
    SUM(is_scoring_opportunity) AS scoring_opportunities,
    ROUND(SUM(is_scoring_opportunity)::DECIMAL / COUNT(corner_id) * 100, 2) AS conversion_rate_pct
FROM corners_v
GROUP BY delivery_type
ORDER BY conversion_rate_pct DESC;


-- 3. Time distribution of corners by match minute (binned by 5-minute intervals) for FC Palermo
SELECT
    FLOOR(minute / 5) * 5 AS minute_bin_start,
    COUNT(*) AS corners_count
FROM match_events me
JOIN teams tm ON me.team_id = tm.team_id
WHERE me.event_type = 'corner'
  AND tm.team_name = 'Palermo'
  AND me.match_id IN (
    SELECT match_id FROM matches WHERE date >= '2023-08-01' AND date <= '2024-05-31'
  )
GROUP BY minute_bin_start
ORDER BY minute_bin_start;


-- 4. Average xG after corner by opponent_defense_shape for FC Venezia
SELECT 
    opponent_defense_shape,
    COUNT(*) AS corner_events,
    ROUND(AVG(xg_after_corner), 4) AS avg_xg_after_corner
FROM corners_analysis ca
JOIN teams t ON ca.team_id = t.team_id
WHERE t.team_name = 'Venezia'
GROUP BY opponent_defense_shape
ORDER BY avg_xg_after_corner DESC;


-- 5. Pattern analysis: average pass_chain_length by delivery_type and delivery_zone for both clubs
SELECT
    ca.delivery_type,
    ca.delivery_zone,
    AVG(ca.pass_chain_length) AS avg_pass_chain
FROM corners_analysis ca
JOIN teams t ON ca.team_id = t.team_id
WHERE t.team_name IN ('Venezia', 'Palermo')
GROUP BY ca.delivery_type, ca.delivery_zone
ORDER BY avg_pass_chain DESC;


-- 6. Top 5 players by number of corners taken for FC Venezia this season
SELECT 
    p.player_name,
    COUNT(me.event_id) AS corners_taken
FROM match_events me
JOIN players p ON me.player_id = p.player_id
JOIN teams t ON me.team_id = t.team_id
WHERE me.event_type = 'corner'
  AND t.team_name = 'Venezia'
  AND me.match_id IN (
    SELECT match_id FROM matches WHERE date >= '2023-08-01' AND date <= '2024-05-31'
  )
GROUP BY p.player_name
ORDER BY corners_taken DESC
LIMIT 5;


-- 7. Average ball speed on corner delivery by delivery_type for FC Palermo
SELECT
    c.delivery_type,
    ROUND(AVG(me.ball_speed), 2) AS avg_ball_speed
FROM match_events me
JOIN corners_analysis c ON me.event_id = c.corner_id
JOIN teams t ON c.team_id = t.team_id
WHERE me.event_type = 'corner'
  AND t.team_name = 'Palermo'
GROUP BY c.delivery_type
ORDER BY avg_ball_speed DESC;


-- 8. Effect of number of attackers in box on goal conversion rate from corners for FC Venezia
WITH corner_goals AS (
    SELECT 
        ca.corner_id,
        ca.num_attackers_in_box,
        CASE WHEN ca.shot_outcome = 'goal' THEN 1 ELSE 0 END AS goal_flag
    FROM corners_analysis ca
    JOIN teams t ON ca.team_id = t.team_id
    WHERE t.team_name = 'Venezia'
)
SELECT
    num_attackers_in_box,
    COUNT(corner_id) AS total_corners,
    SUM(goal_flag) AS goals_scored,
    ROUND(SUM(goal_flag)::DECIMAL / COUNT(corner_id) * 100, 2) AS goal_conversion_pct
FROM corner_goals
GROUP BY num_attackers_in_box
ORDER BY num_attackers_in_box;


-- 9. Distribution of delivery types over the season (monthly) for FC Venezia
SELECT
    TO_CHAR(m.date, 'YYYY-MM') AS month,
    ca.delivery_type,
    COUNT(ca.corner_id) AS corners_count
FROM corners_analysis ca
JOIN matches m ON ca.match_id = m.match_id
JOIN teams t ON ca.team_id = t.team_id
WHERE t.team_name = 'Venezia'
GROUP BY month, ca.delivery_type
ORDER BY month, ca.delivery_type;


-- 10. Average expected goals (xG) of shots following corners by delivery_zone for FC Palermo
SELECT
    ca.delivery_zone,
    ROUND(AVG(ca.xg_after_corner), 4) AS avg_xg
FROM corners_analysis ca
JOIN teams t ON ca.team_id = t.team_id
WHERE t.team_name = 'Palermo'
GROUP BY ca.delivery_zone
ORDER BY avg_xg DESC;

-- 11. Correlation between corner delivery type and successful passes in the box for FC Venezia
WITH corner_passes AS (
    SELECT 
        ca.delivery_type,
        COUNT(me.event_id) AS successful_passes
    FROM corners_analysis ca
    JOIN match_events me ON ca.corner_id = me.corner_id
    JOIN teams t ON ca.team_id = t.team_id
    WHERE t.team_name = 'Venezia'
      AND me.event_type = 'pass'
      AND me.success = TRUE
    GROUP BY ca.delivery_type
)
SELECT
    delivery_type,
    successful_passes,
    CORR(successful_passes, COUNT(ca.corner_id)) AS correlation
FROM corner_passes corner_passes
JOIN corners_analysis ca ON corner_passes.delivery_type = ca.delivery_type
GROUP BY delivery_type, successful_passes
ORDER BY correlation DESC;

-- 12. Average number of corners per match by team for FC Venezia and FC Palermo
SELECT
    t.team_name,
    COUNT(ca.corner_id) AS total_corners,
    COUNT(DISTINCT ca.match_id) AS matches_played,
    ROUND(COUNT(ca.corner_id)::DECIMAL / COUNT(DISTINCT ca.match_id) * 100, 2) AS avg_corners_per_match
FROM corners_analysis ca
JOIN teams t ON ca.team_id = t.team_id
WHERE t.team_name IN ('Venezia', 'Palermo')
GROUP BY t.team_name
ORDER BY avg_corners_per_match DESC;    

-- 13. Analysis of corner kick outcomes by delivery type for FC Venezia
SELECT
    ca.delivery_type,
    COUNT(*) AS total_corners,
    SUM(CASE WHEN ca.shot_outcome = 'goal' THEN 1 ELSE 0 END) AS goals,
    SUM(CASE WHEN ca.shot_outcome = 'shot_on_target' THEN 1 ELSE 0 END) AS shots_on_target,
    SUM(CASE WHEN ca.shot_outcome = 'missed' THEN 1 ELSE 0 END) AS missed_shots,
    ROUND(SUM(CASE WHEN ca.shot_outcome = 'goal' THEN 1 ELSE 0 END)::DECIMAL / COUNT(*) * 100, 2) AS goal_conversion_rate_pct,
    ROUND(SUM(CASE WHEN ca.shot_outcome = 'shot_on_target' THEN 1 ELSE 0 END)::DECIMAL / COUNT(*) * 100, 2) AS shot_on_target_rate_pct
FROM corners_analysis ca
JOIN teams t ON ca.team_id = t.team_id
WHERE t.team_name = 'Venezia'
GROUP BY ca.delivery_type
ORDER BY total_corners DESC;  