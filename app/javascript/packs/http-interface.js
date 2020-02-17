import axios from 'axios';
import Qs from 'qs';

export default axios.create({
  baseURL: 'http://localhost:3000/',
  paramsSerializer: params => Qs.stringify(params, {arrayFormat: 'brackets'})
})
