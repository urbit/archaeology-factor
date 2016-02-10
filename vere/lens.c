/* include/v/vere.h
**
** This file is in the public domain.
*/
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <setjmp.h>
#include <gmp.h>
#include <stdint.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <uv.h>
#include <errno.h>
#include <curses.h>
#include <termios.h>
#include <term.h>

#include "all.h"
#include "vere/vere.h"

/* _lens_send_request(): send request to dill
*/
static void
_lens_send_request(u3_lcon* lon_u)
{
  u3_noun coq = u3dc("scot", c3__ud, lon_u->coq_w);
  u3v_plan(u3nq(u3_blip, c3__lens, coq, u3_nul),
           u3nc(c3__lens,
                u3i_bytes(lon_u->leq_u.siz_w, (c3_y*)lon_u->leq_u.dat_c)));
}

/* _lens_conn_free_early(): free lens connection on failure.
*/
static void
_lens_conn_free_early(uv_handle_t* han_t)
{
  u3_lcon* lon_u = (void*) han_t;
  free(lon_u);
}

/* _lens_conn_free(): free lens connection on close.
*/
static void
_lens_conn_free(uv_handle_t* han_t)
{
  u3_lcon* lon_u = (void*) han_t;

  struct _u3_lens *les_u = &u3_Host.les_u;

  if ( les_u->lon_u == lon_u ) {
    les_u->lon_u = lon_u->nex_u;
  }
  else {
    u3_lcon *pre_u = les_u->lon_u;

    while ( pre_u ) {
      if ( pre_u->nex_u == lon_u ) {
        pre_u->nex_u = lon_u->nex_u;
      }
      else pre_u = pre_u->nex_u;
    }
  }

  free(lon_u->leq_u.dat_c);
  free(lon_u);
}


/* _lens_conn_dead(): free lens connection, close fd.
*/
static void
_lens_conn_dead(u3_lcon *lon_u)
{
  // uL(fprintf(uH, "lens connection dead: %d\n", lon_u->coq_w));

  uv_read_stop((uv_stream_t*) &(lon_u->wax_u));
  uv_close((uv_handle_t*) &(lon_u->wax_u), _lens_conn_free);
}

/* _lens_alloc(): libuv buffer allocator.
*/
static void
_lens_alloc(uv_handle_t* han_u,
            size_t len_i,
            uv_buf_t* buf
            )
{
  void* ptr_v = c3_malloc(len_i);
  *buf = uv_buf_init(ptr_v, len_i);
}

/* _lens_conn_read_cb(): server read callback.
*/
/*
 * `nread` (siz_w) is > 0 if there is data available, 0 if libuv is done reading for
 * now, or < 0 on error.
 *
 * The callee is responsible for closing the stream when an error happens
 * by calling uv_close(). Trying to read from the stream again is undefined.
 *
 * The callee is responsible for freeing the buffer, libuv does not reuse it.
 * The buffer may be a null buffer (where buf->base=NULL and buf->len=0) on
 * error.
 */
static void
_lens_conn_read_cb(uv_stream_t* tcp_u,
                   ssize_t      siz_w,
                   const uv_buf_t *     buf_u)
{
  u3_lcon* lon_u = (u3_lcon*)(void*) tcp_u;
  u3_lreq* leq_u = &lon_u->leq_u;

  u3_lo_open();
  {
    if ( siz_w == UV_EOF ) {
      uL(fprintf(uH, "all done!  Got:\r\n"));
      uL(fprintf(uH, "%.*s\r\n", (c3_i)leq_u->siz_w, leq_u->dat_c));
      _lens_conn_dead(lon_u);      
      _lens_send_request(lon_u);
    } else if ( siz_w < 0 ) {
      uL(fprintf(uH, "lens: read: %s\n", uv_strerror(siz_w)));
      _lens_conn_dead(lon_u);
    } else if ( !buf_u->base ) {
      uL(fprintf(uH, "lens no base\n"));
      _lens_conn_dead(lon_u);
    }
    else {
      uL(fprintf(uH,"dataz (%d): %.*s\n", (c3_i)siz_w,
                    (c3_i)siz_w, (c3_c*)buf_u->base));

      leq_u->dat_c = realloc(leq_u->dat_c, leq_u->siz_w + siz_w);
      memcpy(leq_u->dat_c + leq_u->siz_w, buf_u->base, siz_w);
      leq_u->siz_w += siz_w;

      free(buf_u->base);

      //  u3_lreq* leq_u = c3_malloc(sizeof(u3_lreq));
      //  leq_u->dat_c = buf_u->base;
      //  leq_u->siz_w = siz_w;
      //  leq_u->nex_u = lon_u->leq_u;
      //  lon_u->leq_u = leq_u;
    }
  }
  u3_lo_shut(c3y);
}

/* _lens_conn_new(): create lens tcp connection.
*/
static void
_lens_conn_new(u3_lens *les_u)
{
  u3_lcon *lon_u = c3_malloc(sizeof(u3_lcon));

  uv_tcp_init(u3L, &lon_u->wax_u);

  c3_w ret_w;
  ret_w = uv_accept((uv_stream_t*)&les_u->wax_u,
                    (uv_stream_t*)&lon_u->wax_u);
  if (ret_w == UV_EOF)
  {
    uL(fprintf(uH, "lens: accept: ERROR\n"));

    uv_close((uv_handle_t*)&lon_u->wax_u, _lens_conn_free_early);
  }
  else {
    uv_read_start((uv_stream_t*)&lon_u->wax_u,
                  _lens_alloc,
                  _lens_conn_read_cb);

    lon_u->coq_w = les_u->coq_w++;
    lon_u->leq_u.dat_c = NULL;
    lon_u->leq_u.siz_w = 0;

    lon_u->nex_u = les_u->lon_u;
    les_u->lon_u = lon_u;
  }
}


/* _lens_listen_cb(): listen callback.
*/
static void
_lens_listen_cb(uv_stream_t* str_u, c3_i sas_i)
{
  u3_lens* les_u = (u3_lens*)str_u;

  if ( 0 != sas_i ) {
    uL(fprintf(uH, "lens: listen_cb: ERROR\n"));
  }
  else {
    _lens_conn_new(les_u);
  }
}

/* u3_lens_io_init(): initialize tcp I/O.
*/
void
u3_lens_io_init()
{
  memset(&u3_Host.les_u, 0, sizeof(u3_Host.les_u));
  u3_Host.les_u.coq_w = 1;
  u3_Host.les_u.por_w = 12321;
}

/* u3_lens_io_talk(): start lens tcp listener.
*/
void
u3_lens_io_talk()
{
  u3_lens* les_u = &u3_Host.les_u;

  struct sockaddr_in add_u;

  uv_tcp_init(u3L, &les_u->wax_u);

  memset(&add_u, 0, sizeof(add_u));
  add_u.sin_family = AF_INET;
  add_u.sin_addr.s_addr = INADDR_ANY;

  /*  Try ascending ports.
  */
  while ( 1 ) {
    add_u.sin_port = htons(les_u->por_w);

    int ret;
    if ( 0 != (ret = uv_tcp_bind(&les_u->wax_u, (const struct sockaddr*) & add_u, 0))  ) {
      if ( UV_EADDRINUSE == ret ) {
        les_u->por_w++;
        continue;
      }
      else {
        uL(fprintf(uH, "lens: bind: %s\n", uv_strerror(ret)));
      }
    }
    if ( 0 != (ret = uv_listen((uv_stream_t*)&les_u->wax_u, 16, _lens_listen_cb)) ) {
      if ( UV_EADDRINUSE == ret ) {
        les_u->por_w++;
        continue;
      }
      else {
        uL(fprintf(uH, "lens: listen: %s\n", uv_strerror(ret)));
      }
    }
#if 1
    uL(fprintf(uH, "lens: live on %d\n", les_u->por_w));
#endif
    break;
  }
}
