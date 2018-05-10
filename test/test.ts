import * as supertest from 'supertest';
import { server } from '../lib/app';

const request = supertest(server);

describe('Hello World', function () {
  after(function() {
     server.close();
  });

  it('should say "Hello World"', 
    () => request.get('/')
         .expect(200) );
});
