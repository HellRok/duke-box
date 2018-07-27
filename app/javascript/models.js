import JsonApi from 'devour-client'
import axios from 'axios'

const jsonApi = new JsonApi({apiUrl:'/api/v1'})

let authMiddleware = {
  name: 'auth',
  req: function (payload) {
    if (payload.req.method !== 'GET') {
      payload.req.headers['X-CSRF-Token'] = document.querySelector('.js-csrf-token').textContent;
    }

    return payload
  }
}
let updateTokenMiddleware = {
  name: 'update-csrf-token',
  req: function (payload) {
    if (payload.config.method !== 'GET') {
      axios.get('/csrf-token').then(function(data) {
        document.querySelector('.js-csrf-token').textContent = data.data;
      })
    }
    return payload
  }
}
jsonApi.insertMiddlewareBefore('axios-request', authMiddleware)
jsonApi.insertMiddlewareAfter('axios-request', updateTokenMiddleware)

// Define Model
jsonApi.define('room', {
  owner_uuid: '',
  owner_ip: ''
})

export default jsonApi
