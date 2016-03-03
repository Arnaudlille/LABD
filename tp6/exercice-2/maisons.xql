xquery version "1.0";

declare function local:calculerSurface($m){
	for $s in $m/*/*/@surface-m2
	return $s
};

declare variable $maisons := doc("maisons.xml");

<html>
<body>
<table border="1">
	<thead><tr><th>Maisons</th><th>Surface(m2)</th></tr></thead>
	<tbody>
	{
	for $maison in $maisons//maison
		return
		<tr>
			<td>Maison {data($maison/@id)}</td>
			<td>{sum(local:calculerSurface($maison))}</td>
		</tr>
	}
	</tbody>
</table>
</body>
</html>
