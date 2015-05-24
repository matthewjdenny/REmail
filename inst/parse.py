import email.parser
import email.utils
import sys

def parseElement(filename,element):
	parser = email.parser.Parser()
	email_val = parser.parse(open(filename,"r"))
	element_val=None
	if element.lower()=="message":
		while True:
			try:
				email_val = email_val.get_payload(0)
			except:
				break
		element_val = email_val.get_payload()
	else:
		element_val=email_val.get_all(element)[0]
	if element_val!=None:
		print element_val
	else:
		print ""


parseElement(sys.argv[1],sys.argv[2])
