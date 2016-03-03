import org.xml.sax.* ;
import org.xml.sax.helpers.* ;

public class Ex2 extends DefaultHandler {	
	private int index;
	private Double surface;

	public void startDocument() {
		this.surface = 0.0;
	}

	public void endDocument() {}

	public void startElement(String nameSpaceURI, String localName, String rawName, Attributes attributs){
		String s = attributs.getValue("surface-m2");
		
		if (s != null)
			surface += Double.parseDouble(attributs.getValue("surface-m2"));
		
		if (localName.equals("maison")) index = Integer.parseInt(attributs.getValue("id"));
	}

	public void endElement(String nameSpaceURI, String localName, String rawName)  {
		if (localName.equals("maison")){
			System.out.println("Maison " + index);
			System.out.println("superficie totale = " + surface + " m2");
			surface = 0.0;
		}
	}

	public static void main(String[] args) {
		try {
			XMLReader saxReader = XMLReaderFactory.createXMLReader();
			saxReader.setContentHandler(new Ex2());
			saxReader.parse(args[0]);
		} catch (Exception t) {
			t.printStackTrace();
		}
	}

}
