public class ContactOperations {
    public static Contact setDefaultDescription(Contact c) {     

        if (c.Description == null) 
            c.Description = 'A new contact for this account';                
        else
            c.Description = 'Please provide a description for this contact';
            // return c;

        // Avoid SOQL inside loops
        List<Contact> contacts;
        for (Integer i = 0; i < 2; i++) {
            contacts = [SELECT Id,Description FROM Contact
                        WHERE Contact.FirstName =: c.FirstName];
        }
        
        // Avoid DML Statements inside loops
        Integer size = contacts.size();
        Contact c2;
        for (Integer i = 0; i < size; i++) {
            c2 = contacts[i];
            c2.FirstName = 'First Name';
            c2.LastName = 'Last Name';
        }
        return c2;
    }

    public static Contact setDefaultFirstName(Contact c) {
        // If then Else should have curly braces
        if (c.FirstName == null) 
            c.FirstName = 'Please provide a First Name';                
        else
            c.Description = 'No description';
        
        for (Integer i = 0; i < 10; i++) {
            c.LastName = 'Please provide a Last Name';
            c.Description = 'Please provide a Description';
        }

        return c;        
    }
}