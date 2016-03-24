xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";
declare variable $nomFichier := "expression.xml";
declare variable $constFichier := "onlyConstantes.xml";
declare variable $variables := "variables.xml";

(:Q1 debut :)
declare function local:print($name as xs:string) as xs:string {
	local:printNode(doc($name)//expr/*)
};

declare function local:printNode($noeud as node()) as xs:string {
	if (string(node-name($noeud)) = "op") then
		let $val1 := local:printNode($noeud/*[1])
		let $val2 := local:printNode($noeud/*[2])
		return fn:concat("( ", $val1, " ", $noeud/@val, " ", $val2, " )")
	else
		fn:data($noeud)
};
(:Q1 fin :)


(:Q2 debut :)
declare function local:eval($name as xs:string) as xs:integer {
	local:evalNode(doc($name)//expr/*)
};

declare function local:evalNode($noeud as node()) as xs:integer {
	if (string(node-name($noeud)) = "op") then
		let $val1 := local:evalNode($noeud/*[1])
		let $val2 := local:evalNode($noeud/*[2])
		return local:calculer($val1, string($noeud/@val), $val2)
	else if (string(node-name($noeud)) = "var") then 
		fn:error(xs:QName("ERROR"), "les variables sont interdites!")
	else
		xs:int($noeud)
};

declare function local:calculer($cons1 as xs:integer, $op as xs:string, $cons2 as xs:integer) as xs:integer {
	if ($op = "+") then
		$cons1 + $cons2
	else if ($op = "/") then
		xs:integer($cons1 div $cons2)
	else if ($op = "*") then 
		$cons1 * $cons2
	else 
		$cons1 - $cons2
};
(:Q2 fin :)


(:Q3 debut :)
declare function local:eval-var($name as xs:string, $variables as xs:string) as xs:integer{
	local:evalNodeVar(doc($name)//expr/*, $variables)
};

declare function local:evalNodeVar($noeud as node(), $variables as xs:string) as xs:integer{
	if (string(node-name($noeud)) = "op") then
		let $val1 := local:evalNodeVar($noeud/*[1], $variables)
		let $val2 := local:evalNodeVar($noeud/*[2], $variables)
		return local:calculer($val1, string($noeud/@val), $val2)
	else if (string(node-name($noeud)) = "var") then 
		local:evalVar($noeud, $variables)
	else
		xs:int($noeud)
};

declare function local:evalVar($noeud as node(), $variables as xs:string) as xs:integer{
	if (count(doc($variables)//*[name() = $noeud/text()]) = 0) then
		fn:error(xs:QName("ERROR"), "variable not found")
	else if (count(doc($variables)//*[name() = $noeud/text()]) > 1) then
		fn:error(xs:QName("ERROR"), "too much occurence for the same variable")
	else
		xs:integer(doc($variables)//*[name() = $noeud/text()])
};
(:Q3 fin :)

(:Q4 debut :)
declare function local:simplifie($name as xs:string, $variables as xs:string) as element() {
	local:simplifieNode(doc($name)//expr/*, $variables)
};

declare function local:simplifieNode($noeud as node(), $variables as xs:string) {
	if (string(node-name($noeud)) = "op") then 
		let $val1 := local:evalNodeVar($noeud/*[1], $variables)
		let $val2 := local:evalNodeVar($noeud/*[2], $variables)
		return local:calculer($val1, string($noeud/@val, $val2)
	else if (string(node-name($noeud)) = "var") then
		local:simplifieVar($noeud, $variables)
	else
		
		
};
(:Q4 fin :)

(:Q1 local:print($nomFichier):)
(:Q2 local:eval($constFichier):)
(:Q3 :)local:eval-var($nomFichier, $variables)

