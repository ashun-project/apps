import Vue from 'vue';
import { 
    Button,
    Table,
    TableColumn,
    Submenu,
    Row,
    Col,
    Menu,
    MenuItem,
    MenuItemGroup,
    Form,
    FormItem,
    Input,
    pagination,
    Select,
    Option,
    Dialog,
    Switch,
    Message,
    MessageBox,
    Upload,
    Loading
} from 'element-ui';
Vue.prototype.$Message = Message
Vue.prototype.$confirm = MessageBox.confirm;
Vue.use(Button);
Vue.use(Table);
Vue.use(TableColumn);
Vue.use(Row);
Vue.use(Col);
Vue.use(Submenu);
Vue.use(Menu);
Vue.use(MenuItem);
Vue.use(MenuItemGroup);
Vue.use(Form);
Vue.use(FormItem);
Vue.use(Input);
Vue.use(pagination);
Vue.use(Select);
Vue.use(Option);
Vue.use(Dialog);
Vue.use(Switch);
Vue.use(Upload);
Vue.prototype.$loading = Loading.service;

