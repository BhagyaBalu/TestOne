import { LightningElement, api, wire} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
//import NAME_FIELD from '@salesforce/schema/Account.Name';
//import PHONE_FIELD from '@salesforce/schema/Account.Phone';
export default class DemoLWC1 extends LightningElement {
name = 'Bhagya';
company = 'Salesforce';
designation = 'Software Engineer';
salary = '$200000';
@api recordId;
//@wire(getRecord, {recordId: '$recordId', fields: [NAME_FIELD, PHONE_FIELD]})
@wire(getRecord, {recordId: '$recordId', fields: ['Account.Name', 'Account.Phone']})
record; // record will have data and error
get name(){
    //return this.record.data ? getFieldValue(this.record.data, NAME_FIELD) : '';
    //return this.record.data ? getFieldValue(this.record.data, 'Account.Name') : '';
    return this.record.data.fields.Name.value; //-> To return the value instead of complex line above
}
get phone(){
    //return this.record.data ? getFieldValue(this.record.data, PHONE_FIELD) : '';
   // return this.record.data ? getFieldValue(this.record.data, 'Account.Phone') : '';
    return this.record.data.fields.Phone.value;
}
}