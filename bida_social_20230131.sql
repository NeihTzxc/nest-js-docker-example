--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Debian 12.12-1.pgdg110+1)
-- Dumped by pg_dump version 12.12 (Debian 12.12-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: set_current_timestamp_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: social_bi_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_bi_levels (
    id bigint NOT NULL,
    name text,
    description text,
    type smallint,
    icon_uri text
);


--
-- Name: social_chat_group_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_chat_group_member (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    group_chat_id bigint NOT NULL,
    user_id smallint NOT NULL,
    role smallint NOT NULL,
    add_by bigint NOT NULL,
    last_read_at timestamp without time zone
);


--
-- Name: social_chat_group_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_chat_group_messages (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id_from bigint NOT NULL,
    group_id bigint NOT NULL,
    media_uri text,
    message_data text,
    send_at timestamp without time zone NOT NULL,
    type smallint
);


--
-- Name: social_chat_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_chat_groups (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    name text NOT NULL,
    created_by bigint NOT NULL,
    status smallint
);


--
-- Name: social_group_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_group_member (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    group_id bigint NOT NULL,
    user_id bigint NOT NULL,
    role smallint NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    last_read_at timestamp without time zone DEFAULT now(),
    invited_by bigint,
    accepted_by bigint
);


--
-- Name: social_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_groups (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    name text NOT NULL,
    introduce text,
    created_by bigint,
    status smallint DEFAULT 10 NOT NULL,
    avatar_uri text,
    cover_image_uri text,
    founder text,
    founding_date date,
    type smallint NOT NULL,
    code text,
    total_member integer,
    total_post integer DEFAULT 0
);


--
-- Name: social_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_messages (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id_from bigint NOT NULL,
    user_id_to bigint NOT NULL,
    media_uri text,
    message_data text,
    send_at timestamp without time zone,
    read_at timestamp without time zone,
    type smallint,
    metadata json
);


--
-- Name: social_post_comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_post_comment (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    content text
);


--
-- Name: social_post_like; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_post_like (
    created_at timestamp without time zone DEFAULT now(),
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    deleted_flg boolean DEFAULT false NOT NULL
);


--
-- Name: social_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_posts (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id bigint,
    group_id bigint,
    content text,
    media_uri text,
    location point,
    total_like integer,
    total_comment integer
);


--
-- Name: social_regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_regions (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    name text,
    type integer,
    parent_id integer,
    slug text
);


--
-- Name: social_rosters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_rosters (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id bigint NOT NULL,
    friend_id bigint NOT NULL,
    last_chat_time timestamp without time zone,
    last_read_time timestamp without time zone,
    review character varying,
    mute_status boolean DEFAULT false NOT NULL,
    group_id bigint,
    type smallint
);


--
-- Name: social_system_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_system_info (
    slug text NOT NULL,
    value text,
    type smallint
);


--
-- Name: social_user_approve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_user_approve (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id bigint,
    type smallint,
    review_content jsonb,
    status smallint
);


--
-- Name: social_user_bi_level; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_user_bi_level (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_flg boolean DEFAULT false NOT NULL,
    bi_level_id bigint,
    user_id bigint,
    bi_level double precision
);


--
-- Name: social_user_block; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_user_block (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id bigint NOT NULL,
    target_id bigint
);


--
-- Name: social_user_friend; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_user_friend (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    user_id bigint NOT NULL,
    friend_id bigint NOT NULL,
    source smallint,
    status smallint
);


--
-- Name: social_user_notices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_user_notices (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    send_at timestamp without time zone NOT NULL,
    read_at timestamp without time zone,
    user_id bigint NOT NULL,
    title text,
    content text,
    media_uri text
);


--
-- Name: social_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_users (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_flg boolean DEFAULT false NOT NULL,
    user_code text NOT NULL,
    name text NOT NULL,
    pr text,
    avatar_uri text,
    qrcode_uri text,
    phone text NOT NULL,
    email text,
    birthday date,
    address text,
    gender smallint,
    status smallint DEFAULT 1 NOT NULL,
    social_accounts jsonb,
    avatar_uri_temp text,
    province_id integer,
    district_id integer
);


--
-- Name: user_approve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_approve (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_flg boolean DEFAULT false,
    user_id bigint,
    type smallint,
    review_content jsonb,
    status smallint
);


--
-- Data for Name: social_bi_levels; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_bi_levels (id, name, description, type, icon_uri) VALUES (1, 'Phăng', 'Bida phăng thực chất chỉ là cách gọi của người Việt về một bộ môn thể thao có tên tiếng Anh là Bida France. Trong trò chơi sẽ bao gồm có 3 bi: bi trắng, bi đỏ và bi vàng.', 1, NULL);
INSERT INTO public.social_bi_levels (id, name, description, type, icon_uri) VALUES (2, 'Carom 1 băng', 'Bida 1 băng là hình thức trò chơi bida carom, trò chơi là đánh vào trái bi để chạm đánh trái bi cái của mình chạm vào cả hai bi kia đồng thời cũng đập vào các thành bàn ít nhất ba lần trước khi chạm bi cuối cùng.', 2, NULL);
INSERT INTO public.social_bi_levels (id, name, description, type, icon_uri) VALUES (3, 'Carom 3 băng', 'Mục đích của trò chơi là đánh trái bi cái của mình chạm vào cả hai bi kia và đập vào các thành bàn ít nhất ba lần trước khi chạm bi cuối cùng. Một điểm được tính cho mỗi lần chạm thành công. Trong hầu hết các cú đánh, bi cái chạm vào các bi kia một lần mỗi lần, mặc dù có thể đánh chúng chạm bất kỳ số lần nào đều được phép, miễn là cả hai đều bị chạm trúng. Các tiếp xúc giữa bi cái và thành bàn có thể xảy ra trước và/hoặc sau khi chạm vào bi đối tượng đầu tiên. Bi cái không phải chạm vào ba thành bàn khác nhau miễn là có tiếp xúc với thành bàn ít nhất ba lần. Mỗi người chơi có bi cái của riêng mình.', 3, NULL);


--
-- Data for Name: social_chat_group_member; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: social_chat_group_messages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: social_chat_groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: social_group_member; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454195433470427136, '2022-10-31 04:53:22.279639', '2022-10-31 04:53:22.279639', false, 1453216825272696832, 1449963012961075200, 30, 20, '2022-10-31 04:53:22.279639', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1443987229071376384, '2022-10-24 03:52:25.869143', '2022-10-25 02:11:19.291459', false, 1443987227527872512, 1416363472194633728, 10, 20, '2022-10-24 03:52:25.869143', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1444167593689612288, '2022-10-24 06:51:36.443925', '2022-10-25 02:11:19.291459', false, 1435338783535923200, 1416363472194633728, 30, 20, '2022-10-24 06:51:36.443925', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1449965615677702144, '2022-10-28 06:51:25.621996', '2022-10-28 06:51:25.621996', false, 1449807456946356224, 1449963012961075200, 30, 20, '2022-10-28 06:51:25.621996', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1449978795523047424, '2022-10-28 07:04:31.07609', '2022-10-28 07:04:31.07609', false, 1449802962883837952, 1449963012961075200, 30, 20, '2022-10-28 07:04:31.07609', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450021174971990016, '2022-10-28 07:46:37.075437', '2022-10-28 07:46:37.075437', false, 1449801359854403584, 1449963012961075200, 30, 20, '2022-10-28 07:46:37.075437', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450023779836100608, '2022-10-28 07:49:12.365033', '2022-10-28 07:49:12.365033', false, 1449801359854403584, 1449811397092311040, 30, 20, '2022-10-28 07:49:12.365033', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450223022244888576, '2022-10-28 11:07:08.091665', '2022-10-28 11:07:08.091665', false, 1450223021422804992, 1416363472194633801, 10, 20, '2022-10-28 11:07:08.091665', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450233335535173632, '2022-10-28 11:17:22.891737', '2022-10-28 11:17:22.891737', false, 1450223021422804992, 1449963012961075200, 30, 20, '2022-10-28 11:17:22.891737', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1453216825524355072, '2022-10-30 12:41:12.67618', '2022-10-30 12:41:12.67618', false, 1453216825272696832, 123123, 10, 20, '2022-10-30 12:41:12.67618', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454082189057720320, '2022-10-31 03:00:52.385802', '2022-10-31 03:18:01.926195', true, 1454079575452549120, 1416363472194633702, 30, 20, '2022-10-31 03:00:52.385802', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1449977379442130944, '2022-10-28 07:03:06.702799', '2022-10-31 03:18:10.90529', true, 1449803807197233152, 1449767698836750336, 30, 20, '2022-10-28 07:03:06.702799', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1515349595712913408, '2022-12-12 09:24:34.462595', '2022-12-12 09:24:34.462595', false, 1480125322757144576, 1495074653155098624, 30, 20, '2022-12-12 09:24:34.462595', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1449977379442196480, '2022-10-28 07:03:06.702799', '2022-10-31 03:18:15.502121', true, 1449803807197233152, 1416363472194633804, 30, 20, '2022-10-28 07:03:06.702799', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1449978795539824640, '2022-10-28 07:04:31.07609', '2022-10-31 03:18:15.502121', true, 1449802962883837952, 1416363472194633804, 30, 20, '2022-10-28 07:04:31.07609', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450024453843976192, '2022-10-28 07:49:52.550172', '2022-10-31 03:18:15.502121', true, 1449801359854403584, 1416363472194633804, 30, 20, '2022-10-28 07:49:52.550172', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1516450068356399104, '2022-12-13 03:37:47.668447', '2022-12-13 03:37:47.668447', false, 1414978702227411200, 1495074653155098624, 30, 20, '2022-12-13 03:37:47.668447', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450024953066815488, '2022-10-28 07:50:22.256835', '2022-10-31 03:25:58.506009', true, 1449801359854403584, 1449814936497684480, 30, 20, '2022-10-28 07:50:22.256835', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450233590800449536, '2022-10-28 11:17:38.040127', '2022-10-31 03:25:58.506009', true, 1450223021422804992, 1449814936497684480, 30, 20, '2022-10-28 11:17:38.040127', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454104766291443712, '2022-10-31 03:23:18.102744', '2022-10-31 03:25:58.506009', true, 1454079575452549120, 1449814936497684480, 30, 20, '2022-10-31 03:23:18.102744', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1449965615677767680, '2022-10-28 06:51:25.621996', '2022-10-31 03:26:03.48852', true, 1449807456946356224, 1449962182790873088, 30, 20, '2022-10-28 06:51:25.621996', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450021174972055552, '2022-10-28 07:46:37.075437', '2022-10-31 03:26:03.48852', true, 1449801359854403584, 1449962182790873088, 30, 20, '2022-10-28 07:46:37.075437', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1450233335535108096, '2022-10-28 11:17:22.891737', '2022-10-31 03:26:03.48852', true, 1450223021422804992, 1449962182790873088, 30, 20, '2022-10-28 11:17:22.891737', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1517933668373364736, '2022-12-14 04:11:37.097543', '2022-12-14 04:11:37.097543', false, 1517933667886825472, 1234, 10, 20, '2022-12-14 04:11:37.097543', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454109199385493504, '2022-10-31 03:27:42.313271', '2022-10-31 03:28:19.862647', true, 1454079575452549120, 1449813008292249600, 30, 20, '2022-10-31 03:27:42.313271', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1414978702227406800, '2022-10-21 03:06:33.154953', '2022-10-31 03:28:26.482554', true, 1414978702227411200, 1234, 10, 20, '2022-10-21 03:06:33.154953', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1449977379442262016, '2022-10-28 07:03:06.702799', '2022-10-31 03:28:26.482554', true, 1449803807197233152, 1234, 30, 20, '2022-10-28 07:03:06.702799', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454079576559845376, '2022-10-31 02:58:16.63754', '2022-10-31 03:28:26.482554', true, 1454079575452549120, 1234, 10, 20, '2022-10-31 02:58:16.63754', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454152804896604160, '2022-10-31 04:11:01.45186', '2022-10-31 04:11:26.854931', true, 1454079575452549120, 1416363472194633803, 30, 20, '2022-10-31 04:11:01.45186', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454150645887008768, '2022-10-31 04:08:52.709526', '2022-10-31 04:14:11.298283', true, 1454079575452549120, 1416363472194633802, 30, 20, '2022-10-31 04:08:52.709526', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454195433487204352, '2022-10-31 04:53:22.279639', '2022-10-31 04:53:22.279639', false, 1453216825272696832, 1416363472194633804, 30, 20, '2022-10-31 04:53:22.279639', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454195433487269888, '2022-10-31 04:53:22.279639', '2022-10-31 04:53:22.279639', false, 1453216825272696832, 1234, 30, 20, '2022-10-31 04:53:22.279639', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454195433487335424, '2022-10-31 04:53:22.279639', '2022-10-31 04:53:22.279639', false, 1453216825272696832, 1416363472194633702, 30, 20, '2022-10-31 04:53:22.279639', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1517934979462463488, '2022-12-14 04:12:55.244822', '2022-12-14 04:12:55.244822', false, 1517934978506162176, 1459874675352928256, 10, 20, '2022-12-14 04:12:55.244822', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1455613322048045056, '2022-10-31 03:23:18.102744', '2022-11-01 04:21:55.023222', true, 1454079575452549120, 1449962182790873088, 30, 20, '2022-10-31 03:23:18.102744', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1455614972825501696, '2022-10-31 03:00:52.385802', '2022-11-01 04:23:33.409827', false, 1454079575452549120, 1449767698836750336, 30, 20, '2022-10-31 03:00:52.385802', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1455614972825567232, '2022-10-31 03:00:52.385802', '2022-11-01 04:23:33.409827', false, 1454079575452549120, 1416363472194633804, 30, 20, '2022-10-31 03:00:52.385802', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1455614972825436160, '2022-11-01 04:23:33.409827', '2022-11-01 04:24:14.176923', false, 1454079575452549120, 1449768760297652224, 20, 20, '2022-11-01 04:23:33.409827', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1454158138541342720, '2022-10-31 04:16:19.354002', '2022-11-01 04:25:00.717458', true, 1454079575452549120, 1416363472194633703, 10, 20, '2022-10-31 04:16:19.354002', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1455614972808658944, '2022-11-01 04:23:33.409827', '2022-11-01 04:25:09.159226', false, 1454079575452549120, 1449963012961075200, 10, 20, '2022-11-01 04:23:33.409827', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1517938785894006784, '2022-12-14 04:16:42.125173', '2022-12-14 04:16:42.125173', false, 1517938784618938368, 1234, 10, 20, '2022-12-14 04:16:42.125173', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1519736136560279552, '2022-12-15 10:02:12.579808', '2022-12-15 10:02:12.579808', false, 1519736135939522560, 1495074653155098624, 10, 20, '2022-12-15 10:02:12.579808', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1455814438522191872, '2022-11-01 07:41:42.469055', '2022-11-01 07:45:50.81965', true, 1455814437985320960, 1449814936497684480, 30, 20, '2022-11-01 07:41:42.469055', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1455804739093528576, '2022-11-01 07:32:04.3383', '2022-11-01 08:02:50.880618', false, 1455804738590212096, 1234, 10, 20, '2022-11-01 07:32:04.3383', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1459875843919577088, '2022-11-04 02:56:21.103768', '2022-11-04 02:56:21.103768', false, 1459875843282042880, 1459874675352928256, 10, 20, '2022-11-04 02:56:21.103768', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1467087955754483712, '2022-11-09 02:20:56.459694', '2022-11-09 02:20:56.459694', false, 1467087954278088704, 1234, 10, 20, '2022-11-09 02:20:56.459694', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1467099698530615296, '2022-11-09 02:32:36.39235', '2022-11-09 02:32:36.39235', false, 1467099697456873472, 1436985010392399872, 10, 20, '2022-11-09 02:32:36.39235', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1467101640745025536, '2022-11-09 02:34:32.152999', '2022-11-09 02:34:32.152999', false, 1467101639771947008, 1436985010392399872, 10, 20, '2022-11-09 02:34:32.152999', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1467103401547399168, '2022-11-09 02:36:17.105826', '2022-11-09 02:36:17.105826', false, 1467103400859533312, 1436985010392399872, 10, 20, '2022-11-09 02:36:17.105826', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1467131472849666048, '2022-11-09 03:04:10.29335', '2022-11-09 03:04:10.29335', false, 1467131472027582464, 1436985010392399872, 10, 20, '2022-11-09 03:04:10.29335', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1467132441129910272, '2022-11-09 03:05:07.995651', '2022-11-09 03:05:07.995651', false, 1467132440676925440, 1436985010392399872, 10, 20, '2022-11-09 03:05:07.995651', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1468544484307369984, '2022-11-10 02:27:52.336517', '2022-11-10 02:27:52.336517', false, 1468544483200073728, 1459808658098487296, 10, 20, '2022-11-10 02:27:52.336517', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1468926266534002688, '2022-11-10 08:47:08.333939', '2022-11-10 08:47:08.333939', false, 1468926264722063360, 1459808658098487296, 10, 20, '2022-11-10 08:47:08.333939', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1468929076029816832, '2022-11-10 08:49:55.790352', '2022-11-10 08:49:55.790352', false, 1468929075442614272, 1459808658098487296, 10, 20, '2022-11-10 08:49:55.790352', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1475757925585649664, '2022-11-15 01:53:46.935114', '2022-11-15 01:53:46.935114', false, 1475757924260249600, 1234, 10, 20, '2022-11-15 01:53:46.935114', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1479205419900469248, '2022-11-17 10:58:33.606226', '2022-11-17 10:58:33.606226', false, 1479205418759618560, 1459883127563354112, 10, 20, '2022-11-17 10:58:33.606226', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1548774055358758912, '2023-01-04 10:48:47.435673', '2023-01-04 10:48:47.435673', false, 1519736135939522560, 1548759559391150080, 30, 20, '2023-01-04 10:48:47.435673', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1480125323931549696, '2022-11-18 02:12:24.159404', '2022-11-18 02:12:54.606514', true, 1480125322757144576, 1459882924844253184, 30, 20, '2022-11-18 02:12:24.159404', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1480214157511884800, '2022-11-18 03:40:39.052246', '2022-11-18 03:40:39.052246', false, 1480214157075677184, 1416363472194633804, 10, 20, '2022-11-18 03:40:39.052246', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1484818965225013248, '2022-11-21 07:55:07.01271', '2022-11-21 07:55:07.01271', false, 1484818957960478720, 1459808658098487296, 10, 20, '2022-11-21 07:55:07.01271', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1509440729896714240, '2022-12-08 07:34:38.519931', '2022-12-08 07:34:38.519931', false, 1509440725954068480, 1495074653155098624, 10, 20, '2022-12-08 07:34:38.519931', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1510546437316804608, '2022-12-09 01:53:03.816635', '2022-12-09 01:53:03.816635', false, 1510546437065146368, 1495074653155098624, 10, 20, '2022-12-09 01:53:03.816635', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1514916734379753472, '2022-12-12 02:14:33.885622', '2022-12-12 02:14:33.885622', false, 1484818957960478720, 1495074653155098624, 30, 20, '2022-12-12 02:14:33.885622', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1548774055375536128, '2023-01-04 10:48:47.435673', '2023-01-04 10:48:47.435673', false, 1519736135939522560, 1548642204828827648, 30, 20, '2023-01-04 10:48:47.435673', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1548774055375601664, '2023-01-04 10:48:47.435673', '2023-01-09 03:45:55.454809', false, 1519736135939522560, 1548618327377575936, 20, 20, '2023-01-04 10:48:47.435673', NULL, NULL);
INSERT INTO public.social_group_member (id, created_at, updated_at, deleted_flg, group_id, user_id, role, status, last_read_at, invited_by, accepted_by) VALUES (1555598759298072576, '2023-01-09 03:48:31.519653', '2023-01-09 03:48:31.519653', false, 1519736135939522560, 1551662482051825664, 30, 20, '2023-01-09 03:48:31.519653', NULL, NULL);


--
-- Data for Name: social_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1467103400859533312, '2022-11-09 02:36:17.087075', '2022-11-18 03:45:28.983657', false, 'Ăn Nhậu', 'Đô 1 lon', 1436985010392399872, 30, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, 'Tai Heo', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1455814437985320960, '2022-11-01 07:41:42.462391', '2022-11-01 07:45:50.839008', false, 'Tét 11111', '??1111', 1449814936497684480, 40, 'data/1455814419211616256/origin/5.png', 'data/1455815153583915008/origin/user03.jpg', 'Đăng 333 111', '2022-09-05', 20, NULL, 0, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1455804738590212096, '2022-11-01 07:32:04.325258', '2022-11-01 08:03:04.121176', false, 'Hihihi Update', 'Gớ htieuj Update', 1234, 40, 'data/1455804719380299776/origin/1.png', 'data/1455805393388175360/origin/user08.jpg', '30/11 Đăng Update', '1970-01-01', 20, NULL, 1, 1);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1468929075442614272, '2022-11-10 08:49:55.773839', '2022-11-18 06:56:25.862967', false, 'Son tung Mtp', 'SINGLE', 1459808658098487296, 30, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, 'Tai Heo', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1475757924260249600, '2022-11-15 01:53:46.922159', '2022-11-18 03:34:34.366183', false, 'toi la', 'asdasdasdsd', 1234, 30, 'data/1475757909513076736/origin/algolia.png', NULL, 'taiiii', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1468544483200073728, '2022-11-10 02:27:52.319696', '2022-11-17 02:58:51.813703', false, 'Lien Minh Mobile', 'Hasagi', 1459808658098487296, 30, 'data/1455814419211616256/origin/5.png', NULL, 'Tien Tai', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1454079575452549120, '2022-10-31 02:58:16.624767', '2022-11-07 02:34:27.092579', false, 'Đăng Test Update', 'ahihi Update', 1234, 30, 'data/1454081389539360768/origin/1.png', 'data/1454081392475373568/origin/banner9.jpg', 'Đăng Lập Update', '1970-01-01', 20, NULL, 4, 3);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1459875843282042880, '2022-11-04 02:56:21.084182', '2022-11-08 07:38:38.032628', false, 'Test ', 'Test Test Test  111', 1459874675352928256, 30, 'data/1459875818619535360/origin/10.png', NULL, '11111 Test ', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1480125322757144576, '2022-11-18 02:12:24.148555', '2022-12-21 07:22:05.245341', false, 'taaaaaa 123', 'ádasdasasdsd', 1459882924844253184, 20, 'data/1516859837076471808/origin/ReactNativecroppedimage3184619935365064561.jpg', 'data/1519591950917828608/origin/ReactNativecroppedimage6816183212854524177.jpg', 'aaaaaa', '1970-01-01', 20, NULL, 1, 2);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1449792299016912896, '2022-10-28 03:59:15.052181', '2022-10-28 03:59:15.052181', false, 'Tên câu lạc bộ', 'Giới thiệu', NULL, 10, '', NULL, 'Tên người sáng lập', '2022-10-26', 20, NULL, 0, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1449803807197233152, '2022-10-28 04:10:40.959397', '2022-10-28 10:56:30.742953', false, 'lạc 1', 'dddd 1', NULL, 30, 'data/1449805627609055232/origin/2.png', 'data/1449806498564669440/origin/1300x810.png', 'người 1', '1970-01-01', 20, NULL, 3, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1450212137690464256, '2022-10-28 10:56:19.344074', '2022-10-28 10:56:48.218466', false, 'Club Nhật Kiều', 'HIHI', 1416363472194633702, 20, 'data/1450212117557805056/origin/user08.jpg', 'data/1450212619062345728/origin/banner9.jpg', 'Đăng Long 123', '2022-10-12', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1467087954278088704, '2022-11-09 02:20:56.434677', '2022-11-09 02:20:56.434677', false, 'Developer WebSite', '- Support FullStack WebSite.', 1234, 20, 'data/1467087928256626688/origin/logobackgroublack.png', NULL, 'Nguyễn Tiến Tài', '2022-11-09', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1450155852194381824, '2022-10-28 10:00:24.478874', '2022-11-02 03:21:31.975803', false, 'Cỏ Mỹ', 'asddasdas', 1234, 20, 'data/1450155826709790720/origin/3.png', NULL, 'Đăng Nè', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1453216825272696832, '2022-10-30 12:41:12.657162', '2022-10-31 04:53:45.201994', false, 'Developer', 'NHom Dev', 123123, 20, 'data/1454195815386972160/origin/3.png', NULL, 'Tai Dev Web', '2022-10-29', 20, NULL, 5, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1450223021422804992, '2022-10-28 11:07:08.078733', '2022-11-10 08:28:08.065731', false, 'Nước mía', 'Chua lè chua lét', 1416363472194633801, 30, 'data/1450222997683044352/origin/5.png', NULL, 'Tien Tai', '1970-01-01', 20, NULL, 4, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1443987227527872512, '2022-10-24 03:52:25.840662', '2022-11-02 04:38:36.902827', false, 'Club Test Update 2022', 'introduce test update 2022', 1416363472194633728, 30, 'https://m.media-amazon.com/images/I/51fHAF3OAyL._AC_SY780_.jpg', 'https://m.media-amazon.com/images/I/51fHAF3OAyL._AC_SY780_.jpg', 'Thien update', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1467099697456873472, '2022-11-09 02:32:36.374837', '2022-11-09 02:32:36.374837', false, 'Dev Web', 'FullStack Developer', 1436985010392399872, 10, 'avatar.jpg', NULL, '1234', '2022-09-11', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1467101639771947008, '2022-11-09 02:34:32.138205', '2022-11-09 02:34:32.138205', false, 'o O O O O O', 'o O O O O', 1436985010392399872, 10, 'avatar.jpg', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', '2022-09-11', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1449802962883837952, '2022-10-28 04:09:50.65624', '2022-11-02 03:28:53.101515', false, 'asdas', 'sadasdasd', NULL, 20, '', NULL, 'sadasd', '1970-01-01', 20, NULL, 8, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1450221012116307968, '2022-10-28 11:05:08.325721', '2022-11-10 02:23:26.432318', false, 'Test', 'Test 3', 1416363472194633703, 10, 'data/1450220993812365312/origin/12.png', NULL, 'Test 1', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1449801359854403584, '2022-10-28 04:08:15.072292', '2022-11-02 03:36:21.64293', false, 'Club Hoa đà', 'Đến với Hoa Đà hãy đọc mã A Tấn đễ giảm giá nhé', NULL, 10, '', NULL, 'Đăng Long', '2022-09-30', 20, 'A Tấn cute pho mai que', 8, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1449807456946356224, '2022-10-28 04:14:18.475682', '2022-11-10 02:35:52.362565', false, 'Cà phê', 'Ca phê đen không đá', NULL, 30, 'data/1450206485815492608/origin/5.png', 'data/1450206488650842112/origin/2.png', 'Tien Tai', '2000-05-31', 20, NULL, 29, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1468926264722063360, '2022-11-10 08:47:08.300341', '2022-11-10 08:49:50.998607', false, 'Son tung Mtp', 'SINGLE', 1459808658098487296, 30, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, 'Tai Heo', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1509440725954068480, '2022-12-08 07:34:38.442823', '2022-12-08 09:01:02.186909', false, 'ten 123', '112d111', 1495074653155098624, 20, NULL, NULL, 'asda', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1445832271171944448, '2022-10-25 10:25:18.990223', '2022-11-10 07:19:59.836166', false, 'Nước ngọt', 'Sữa đá chanh', 1274452618235674626, 30, 'https://sanxuatbia.com/wp-content/uploads/2020/05/huong-dan-cach-bao-quan-cac-phu-tung-bida-2.jpg', 'https://sanxuatbia.com/wp-content/uploads/2020/05/huong-dan-cach-bao-quan-cac-phu-tung-bida-2.jpg', 'Tien Tai', '1970-01-01', 20, NULL, 0, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1467131472027582464, '2022-11-09 03:04:10.272849', '2022-11-18 03:39:44.606958', false, 'Ăn Nhậu', 'Đô 1 lon', 1436985010392399872, 30, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, 'Tai Heo', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1517933667886825472, '2022-12-14 04:11:37.08912', '2022-12-14 04:11:37.08912', false, '123123123123', '123123123213213', 1234, 20, 'data/1517933656729976832/origin/datelabel.png', NULL, 'tai', '2022-12-15', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1467132440676925440, '2022-11-09 03:05:07.987517', '2022-11-18 03:35:28.803064', false, 'Dev Web', 'FullStack developer', 1436985010392399872, 30, 'data/1439981060174643200/origin/user03.jpg', NULL, 'Tiến Tài Dev', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1480214157075677184, '2022-11-18 03:40:39.046172', '2022-11-18 03:42:23.752258', false, '123123123', '123123123', 1416363472194633804, 30, 'data/1480214145834942464/origin/comment.png', NULL, '123123123', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1517934978506162176, '2022-12-14 04:12:55.237091', '2022-12-14 04:12:55.237091', false, 'qwqqqqqqq', 'qqqqqqqqqq', 1459874675352928256, 20, 'data/1517934963020791808/origin/mainslider32.jpg', NULL, 'qqqqqqqq', '2022-12-07', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1479205418759618560, '2022-11-17 10:58:33.587707', '2022-11-18 03:44:08.063265', false, 'Tên câu lạc bộ', 'Tên câu lạc bộ 123', 1459883127563354112, 30, 'data/1479205374484545536/origin/202211161353.png', NULL, 'Tên câu lạc bộ 3', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1414978702227411200, '2022-10-21 02:48:54.533704', '2023-01-18 02:30:53.503202', false, 'CLB Liên quân mobile 3333', 'Thắng bại tại wifi 33', NULL, 20, 'data/1516827856330555392/origin/ReactNativecroppedimage5591382654112658606.jpg', 'data/1517892592765763584/origin/banner36.jpg', 'Long Đăng 123', '1970-01-01', 20, 'lqm_#331234', 21, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1517938784618938368, '2022-12-14 04:16:42.115897', '2022-12-14 04:16:42.115897', false, '123123', '123123', 1234, 20, 'data/1517938768277929984/origin/2kindtoybanner1.jpg', NULL, '123123', '2022-12-15', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1510546437065146368, '2022-12-09 01:53:03.809678', '2022-12-15 09:58:56.063021', false, '12312d', 'sda123', 1495074653155098624, 20, NULL, NULL, 'dd', '1970-01-01', 20, NULL, 1, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1519736135939522560, '2022-12-15 10:02:12.561238', '2023-01-18 02:29:37.715574', false, '1231', '321321', 1495074653155098624, 20, 'data/1519736127567691776/origin/rnimagepickerlibtemp6be94ba2f8de43e2bdbade2e3a311fa5.jpg', NULL, 'asd123', '1970-01-01', 20, NULL, 5, 0);
INSERT INTO public.social_groups (id, created_at, updated_at, deleted_flg, name, introduce, created_by, status, avatar_uri, cover_image_uri, founder, founding_date, type, code, total_member, total_post) VALUES (1484818957960478720, '2022-11-21 07:55:06.889294', '2023-01-18 02:30:34.001225', false, 'Son tung Mtp 666666666666666', 'SINGLE', 1459808658098487296, 30, 'data/1516886598732480512/origin/ReactNativecroppedimage1836272115914636176.jpg', 'data/1515000011480367104/origin/banner36.jpg', 'Tai Heo', '1970-01-01', 20, NULL, 2, 1);


--
-- Data for Name: social_messages; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1443989261144555523, '2022-11-04 08:46:12.582284', '2022-11-04 08:46:12.582284', false, 1459874675352928256, 1459883127563354112, 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', NULL, '2022-11-04 03:03:35.320857', NULL, 30, '{"thumb":"data/1445660806380257280/origin/user11.jpg"}');
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1443989261144555524, '2022-11-04 10:11:05.575718', '2022-11-04 10:11:05.575718', false, 1459874675352928256, 1459883127563354112, 'data/1455814419211616256/origin/5.png', NULL, '2022-11-04 03:03:35.320857', NULL, 20, '{"thumb":"data/1455814419211616256/origin/5.png"}');
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1449963113962075200, '2022-11-01 02:28:18.175288', '2022-11-03 03:13:10.736814', false, 1449963012961075200, 1234, NULL, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2022-10-28 04:08:15.072292', NULL, 60, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1443989261144555522, '2022-11-04 04:31:18.359652', '2022-11-04 04:40:44.032605', false, 1459883127563354112, 1459874675352928256, NULL, 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ', '2022-11-04 03:03:35.320857', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467463173006163968, '2022-11-09 08:33:41.150025', '2022-11-18 03:18:33.439362', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST4', '2022-11-09 08:33:41.108', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1443989261144555525, '2022-11-04 10:15:56.219921', '2022-11-04 10:15:56.219921', false, 1459874675352928256, 1459883127563354112, 'data/1419588650663936000/origin/F9856998-BC20-445A-8EFB-E5DFBC7A7155.png', NULL, '2022-11-04 03:03:35.320857', NULL, 50, '{"location":"(12.2383665,109.1930152)","thumb":"data/1419588650663936000/origin/F9856998-BC20-445A-8EFB-E5DFBC7A7155.png"}');
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1443989261144555500, '2022-11-04 04:31:18.359652', '2022-11-04 08:44:00.237013', true, 1459883127563354000, 1459883127563354000, 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', NULL, '2022-11-04 03:03:35.320857', NULL, 30, '{"thumb":"data/1445660806380257280/origin/user11.jpg"}');
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1443989261144555527, '2022-11-04 04:31:18.359652', '2022-11-04 04:40:44.032605', false, 1459883127563354112, 1459882924844253184, NULL, 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ', '2022-11-04 03:03:35.320857', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1449963013961075200, '2022-11-01 01:46:41.884038', '2022-11-03 06:52:05.151371', false, 1234, 1449963012961075200, NULL, 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ', '2022-10-28 04:08:15.072292', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1449963013931075201, '2022-11-01 01:46:41.884038', '2022-11-03 06:52:19.670957', true, 1234, 1449963012961075200, NULL, 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ', '2022-10-28 04:08:15.072292', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1449963213962075200, '2022-11-01 02:28:41.122092', '2022-11-03 07:27:12.459989', true, 1449963012961075200, 1234, 'data/1445660806380257280/origin/user11.jpg', NULL, '2022-10-28 04:08:15.072292', NULL, 20, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1449963013961075201, '2022-11-01 01:46:41.884038', '2022-11-03 09:30:57.636638', true, 1234, 1449963012961075200, NULL, 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ', '2022-10-28 04:08:15.072292', NULL, 50, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1443989261144555529, '2022-11-04 10:57:59.984707', '2022-11-04 10:57:59.984707', false, 1459883127563354112, 1459874675352928256, NULL, NULL, '2022-11-04 03:03:35.320857', NULL, 60, '{"call_end":"1666663529666","call_start":"1666688102713","call_status":2,"duration":0}');
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1449963013962075200, '2022-11-01 02:27:52.365515', '2022-11-08 03:41:45.299542', true, 1234, 1449963012961075200, NULL, 'd typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ', '2022-10-28 04:08:15.072292', NULL, 30, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467456281513033728, '2022-11-09 08:26:50.543921', '2022-11-18 03:35:37.923226', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST1', '2022-11-09 08:26:50.235', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467461497515933696, '2022-11-09 08:32:01.325587', '2022-12-14 04:13:25.505621', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST1', '2022-11-09 08:32:01.197', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467463073534050304, '2022-11-09 08:33:35.239475', '2023-01-04 09:31:05.03702', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST3', '2022-11-09 08:33:35.17', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467463013505171456, '2022-11-09 08:33:31.646341', '2023-01-04 09:31:07.645536', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST2', '2022-11-09 08:33:31.598', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467462938846560256, '2022-11-09 08:33:27.193695', '2023-01-04 09:34:54.746113', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST1', '2022-11-09 08:33:27.14', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467462935088463872, '2022-11-09 08:33:26.968524', '2023-01-04 09:34:56.713612', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST1', '2022-11-09 08:33:26.924', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467462927907815424, '2022-11-09 08:33:26.54308', '2023-01-04 09:34:58.636694', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST1', '2022-11-09 08:33:26.492', NULL, 10, NULL);
INSERT INTO public.social_messages (id, created_at, updated_at, deleted_flg, user_id_from, user_id_to, media_uri, message_data, send_at, read_at, type, metadata) VALUES (1467462914972581888, '2022-11-09 08:33:25.793654', '2023-01-04 09:35:00.450896', true, 1459808658098487296, 1449753958514950144, NULL, 'TEST1', '2022-11-09 08:33:25.713', NULL, 10, NULL);


--
-- Data for Name: social_post_comment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989261144555520, '2022-10-24 03:54:26.996384', '2022-10-24 03:54:26.996384', false, 1416363472194633728, 1443988445503422464, 'Test comment');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989325451624448, '2022-10-24 03:54:30.80561', '2022-10-24 03:54:30.80561', false, 1416363472194633728, 1443988445503422464, 'Test comment1');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989396687683584, '2022-10-24 03:54:35.058626', '2022-10-24 03:54:35.058626', false, 1416363472194633728, 1443988445503422464, 'Test comment2');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989466682228736, '2022-10-24 03:54:39.224094', '2022-10-24 03:54:39.224094', false, 1416363472194633728, 1443988445503422464, 'Test comment3');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989527902289920, '2022-10-24 03:54:42.872263', '2022-10-24 03:54:42.872263', false, 1416363472194633728, 1443988445503422464, 'Test comment4');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989588736475136, '2022-10-24 03:54:46.501023', '2022-10-24 03:54:46.501023', false, 1416363472194633728, 1443988445503422464, 'Test comment5');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989662707220480, '2022-10-24 03:54:50.912288', '2022-10-24 03:54:50.912288', false, 1416363472194633728, 1443988445503422464, 'Test comment6');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400640, '2022-10-24 03:54:54.543331', '2022-10-24 03:54:54.543331', false, 1416363472194633728, 1443988445503422464, 'Test comment7');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400641, '2022-10-24 07:02:49.443971', '2022-10-24 07:02:49.443971', false, 1416363472194633728, 1414978712227411200, 'Comment 1');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400642, '2022-10-24 07:02:52.430672', '2022-10-24 07:02:52.430672', false, 1416363472194633728, 1414978712227411200, 'Comment 1');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400643, '2022-10-24 07:02:56.762675', '2022-10-24 07:02:56.762675', false, 1416363472194633728, 1414978712227411200, 'Comment 1');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400645, '2022-10-24 07:04:23.686951', '2022-10-24 07:04:23.686951', false, 1234, 1414978712227411200, 'Comment 2');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400646, '2022-10-24 07:04:28.145398', '2022-10-24 07:04:28.145398', false, 1234, 1414978712227411200, 'Comment 3');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400647, '2022-10-24 07:04:33.117579', '2022-10-24 07:04:33.117579', false, 1234, 1414978712227411200, 'Comment 4');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400648, '2022-10-24 07:04:37.918097', '2022-10-24 07:04:37.918097', false, 1234, 1414978712227411200, 'Comment 5');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400649, '2022-10-24 07:04:42.332749', '2022-10-24 07:04:42.332749', false, 1234, 1414978712227411200, 'Comment 6');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518204214990340096, '2022-12-14 08:40:22.933454', '2022-12-14 08:40:22.933454', false, 1495074653155098624, 1515290450674581504, 'hihi');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518204544075431936, '2022-12-14 08:40:42.550065', '2022-12-14 08:40:42.550065', false, 1495074653155098624, 1515290450674581504, 'ehhe');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518205039556952064, '2022-12-14 08:41:12.083356', '2022-12-14 08:41:12.083356', false, 1495074653155098624, 1515290450674581504, 'ok cha');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518205170318573568, '2022-12-14 08:41:19.885431', '2022-12-14 08:41:19.885431', false, 1495074653155098624, 1515290450674581504, 'hihi');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1519534976851247104, '2022-12-15 06:42:22.522096', '2022-12-15 06:42:22.522096', false, 1495074653155098624, 1515446573994082304, 'asdsadasd');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1519535525633982464, '2022-12-15 06:42:55.248252', '2022-12-15 06:42:55.248252', false, 1495074653155098624, 1515446573994082304, 'sdsadasdsad');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1519789853665918976, '2022-12-15 10:55:34.395091', '2022-12-15 10:55:34.395091', false, 1416363472194633728, 1443988445503422464, 'Test comment7');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1520728088617418752, '2022-12-16 02:27:37.525411', '2022-12-16 02:27:37.525411', false, 1495074653155098624, 1515446573994082304, 'ddd');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1520728821681094656, '2022-12-16 02:28:21.244643', '2022-12-16 02:28:21.244643', false, 1495074653155098624, 1515446573994082304, 'asdsadsadsad');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400650, '2022-10-24 07:04:46.828677', '2023-01-05 03:58:30.051385', true, 1234, 1414978712227411200, 'Comment 7');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400653, '2022-10-24 07:05:01.986085', '2022-11-01 07:05:40.73966', true, 1234, 1414978712227411200, 'Comment 10');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400652, '2022-10-24 07:04:57.516473', '2022-11-07 02:31:26.293399', true, 1234, 1414978712227411200, 'Comment 9');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400644, '2022-10-24 07:04:19.180574', '2022-11-07 02:33:11.764468', true, 1234, 1414978712227411200, 'Comment 1');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400657, '2022-10-24 07:04:57.516473', '2022-11-07 02:33:16.758475', true, 1234, 1414978712227411200, 'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1443989723692400651, '2022-10-24 07:04:52.69127', '2022-11-07 02:33:43.6184', true, 1234, 1414978712227411200, 'Comment 8');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1465705619859177472, '2022-11-08 03:27:42.895069', '2022-11-08 03:27:42.895069', false, 1416363472194633728, 1443988445503422464, 'Test comment7');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518167155814694912, '2022-12-14 08:03:34.036989', '2022-12-14 08:03:34.036989', false, 1495074653155098624, 1515290450674581504, 'comment');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518169207248781312, '2022-12-14 08:05:36.328765', '2022-12-14 08:05:36.328765', false, 1495074653155098624, 1515290450674581504, 'comment 11231231');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518171428300521472, '2022-12-14 08:07:48.694341', '2022-12-14 08:07:48.694341', false, 1495074653155098624, 1515290450674581504, 'comment 11231231 tiep');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518175188980596736, '2022-12-14 08:11:32.861355', '2022-12-14 08:11:32.861355', false, 1495074653155098624, 1515290450674581504, 'dang test');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518198578399412224, '2022-12-14 08:34:46.99565', '2022-12-14 08:34:46.99565', false, 1495074653155098624, 1515290450674581504, '32323');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518200827016118272, '2022-12-14 08:37:00.994609', '2022-12-14 08:37:00.994609', false, 1495074653155098624, 1515290450674581504, 'app ne');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518200943684878336, '2022-12-14 08:37:07.951164', '2022-12-14 08:37:07.951164', false, 1495074653155098624, 1515290450674581504, 'aaa');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518202626775187456, '2022-12-14 08:38:48.271499', '2022-12-14 08:38:48.271499', false, 1495074653155098624, 1515290450674581504, '123123');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518202850751021056, '2022-12-14 08:39:01.617441', '2022-12-14 08:39:01.617441', false, 1495074653155098624, 1515290450674581504, 'asdas');
INSERT INTO public.social_post_comment (id, created_at, updated_at, deleted_flg, user_id, post_id, content) VALUES (1518203811246637056, '2022-12-14 08:39:58.868657', '2022-12-14 08:39:58.868657', false, 1495074653155098624, 1515290450674581504, '555');


--
-- Data for Name: social_post_like; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_post_like (created_at, user_id, post_id, deleted_flg) VALUES ('2022-10-24 03:56:07.13', 1416363472194633728, 1443988445503422464, false);


--
-- Data for Name: social_posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1443988445503422464, '2022-10-24 03:53:38.374096', '2022-10-24 03:53:38.374096', false, 1416363472194633728, 1443987227527872512, 'Noi dung test', 'https://m.media-amazon.com/images/M/MV5BYWMyOTE2NzQtYWJlYy00MTU2LTk0MjMtYjhkYzJkYjAwZGJjXkEyXkFqcGdeQXVyODkxNzAwMDI@._V1_.jpg', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1515446573994082304, '2022-12-12 11:00:54.757702', '2022-12-12 11:00:54.757702', false, NULL, 1480125322757144576, 'ALO', 'data/1515446557887954944/origin/banner36.jpg', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1454124824442961920, '2022-10-31 03:43:13.690182', '2022-10-31 03:43:13.690182', false, NULL, 1454079575452549120, 'Noi dung', '', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1454128015905652736, '2022-10-31 03:46:23.877885', '2022-10-31 03:46:23.877885', false, NULL, 1454079575452549120, 'asdasd', '', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1454128905651748864, '2022-10-31 03:47:16.91698', '2022-10-31 03:58:07.457036', true, NULL, 1454079575452549120, '123123', '', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1516423838605246464, '2022-12-13 03:11:44.2729', '2022-12-13 03:11:44.2729', false, NULL, 1480125322757144576, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'data/1516423772989554688/origin/03.jpg', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1454131175441301504, '2022-10-31 03:49:32.202128', '2022-11-01 04:56:40.818848', false, NULL, 1454079575452549120, 'o ze', 'data/1455648294557450240/origin/12.png', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1548774955422842880, '2023-01-04 10:49:41.081263', '2023-01-04 10:50:04.5507', true, NULL, 1519736135939522560, '123eddd4 41 3324 32 2 4234', 'data/1548775180153651200/origin/user-06.jpg', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1414978712227411200, '2022-10-24 02:47:04.173897', '2023-01-05 03:58:30.068379', false, 1234, 1414978702227411200, ' What is Lorem Ipsum?  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it?  It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).  Where does it come from?  Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Where can I get some?  There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'data/1517893045515714560/origin/03.jpg', NULL, 230, 2);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1455835940504207360, '2022-11-01 08:03:04.11622', '2022-11-01 08:03:04.11622', false, NULL, 1455804738590212096, 'dádá1', 'data/1455835929112477696/origin/1200x810.png', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1480126034866077696, '2022-11-18 02:13:06.550651', '2022-11-18 02:13:24.156844', true, NULL, 1480125322757144576, 'cung oke 123123', 'data/1480126024615198720/origin/guay1removebgpreview.png', NULL, 0, 0);
INSERT INTO public.social_posts (id, created_at, updated_at, deleted_flg, user_id, group_id, content, media_uri, location, total_like, total_comment) VALUES (1515290450674581504, '2022-12-12 08:25:49.298156', '2022-12-12 08:47:55.024991', false, 1495074653155098624, 1484818957960478720, 'Lorem Ipsum chỉ đơn giản là một đoạn văn bản giả, được dùng vào việc trình bày và dàn trang phục vụ cho in ấn. Lorem Ipsum đã được sử dụng như một văn bản chuẩn cho ngành công nghiệp in ấn từ những năm 1500, khi một họa sĩ vô danh ghép nhiều đoạn văn bản với nhau để tạo thành một bản mẫu văn bản. Đoạn văn bản này không những đã tồn tại năm thế kỉ, mà khi được áp dụng vào tin học văn phòng, nội dung của nó vẫn không hề bị thay đổi. Nó đã được phổ biến trong những năm 1960 nhờ việc bán những bản giấy Letraset in những đoạn Lorem Ipsum, và gần đây hơn, được sử dụng trong các ứng dụng dàn trang, như Aldus PageMaker.', 'data/1515290101171617792/origin/banner36.jpg', NULL, 0, 0);


--
-- Data for Name: social_regions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: social_rosters; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_rosters (id, created_at, updated_at, deleted_flg, user_id, friend_id, last_chat_time, last_read_time, review, mute_status, group_id, type) VALUES (1467463173274599424, '2022-11-09 08:32:01.340325', '2022-11-09 08:33:41.16843', false, 1459808658098487296, 1449753958514950144, '2022-11-09 08:33:41.108', '2022-11-09 08:33:41.108', 'TEST4', false, NULL, NULL);
INSERT INTO public.social_rosters (id, created_at, updated_at, deleted_flg, user_id, friend_id, last_chat_time, last_read_time, review, mute_status, group_id, type) VALUES (1467463173291376640, '2022-11-09 08:32:01.3483', '2022-11-09 08:33:41.17', false, 1449753958514950144, 1459808658098487296, '2022-11-09 08:33:41.108', NULL, 'TEST4', false, NULL, NULL);


--
-- Data for Name: social_system_info; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: social_user_approve; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519736136560279552, '2022-12-15 10:02:12.585595', '2022-12-15 10:02:12.585595', false, 1495074653155098624, 1, '{"name": "1231", "group_id": "1519736135939522560", "avatar_uri": "data/1519736127567691776/origin/rnimagepickerlibtemp6be94ba2f8de43e2bdbade2e3a311fa5.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1468544484307369984, '2022-11-10 02:27:52.352206', '2022-11-10 02:27:52.352206', false, 1459808658098487296, 1, '{"name": "Lien Minh Pc", "group_id": "1468544483200073728", "avatar_uri": "data/1455814419211616256/origin/5.png"}', 3);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1468929076029816832, '2022-11-10 08:49:55.802237', '2022-11-10 08:49:55.802237', false, 1459808658098487296, 1, '{"name": "Son tung Mtp", "group_id": "1468929075442614272", "avatar_uri": "data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg"}', 3);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1468556637269655552, '2022-11-10 02:39:56.70373', '2022-11-10 02:39:56.70373', false, 1459808658098487296, 2, '{"name": "Nước ngọt", "group_id": "1445832271171944448", "avatar_uri": "https://sanxuatbia.com/wp-content/uploads/2020/05/huong-dan-cach-bao-quan-cac-phu-tung-bida-2.jpg"}', 3);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1509440729896714240, '2022-12-08 07:34:38.526693', '2022-12-08 07:34:38.526693', false, 1495074653155098624, 1, '{"name": "ten 123", "group_id": "1509440725954068480"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519334668518817792, '2022-12-15 03:23:23.219823', '2022-12-15 03:23:23.219823', false, 1495074653155098624, 2, '{"name": "Son tung Mtp 2", "group_id": "1484818957960478720", "avatar_uri": "data/1516886598732480512/origin/ReactNativecroppedimage1836272115914636176.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519336590617346048, '2022-12-15 03:25:17.7803', '2022-12-15 03:25:17.7803', false, 1495074653155098624, 2, '{"name": "Son tung Mtp 3", "group_id": "1484818957960478720", "avatar_uri": "data/1516886598732480512/origin/ReactNativecroppedimage1836272115914636176.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519337632549568512, '2022-12-15 03:26:19.884295', '2022-12-15 03:26:19.884295', false, 1495074653155098624, 2, '{"name": "Son tung Mtp 6", "group_id": "1484818957960478720", "avatar_uri": "data/1516886598732480512/origin/ReactNativecroppedimage1836272115914636176.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1468558680214470656, '2022-11-10 02:41:58.471082', '2022-11-10 02:41:58.471082', false, 1459808658098487296, 2, '{"name": "Nước mía", "group_id": "1450223021422804992", "avatar_uri": "data/1450222997683044352/origin/5.png"}', 3);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519341953236336640, '2022-12-15 03:30:37.417463', '2022-12-15 03:30:37.417463', false, 1495074653155098624, 2, '{"name": "Son tung Mtp", "group_id": "1484818957960478720", "avatar_uri": "data/1516886598732480512/origin/ReactNativecroppedimage1836272115914636176.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519343660955598848, '2022-12-15 03:32:19.206943', '2022-12-15 03:32:19.206943', false, 1495074653155098624, 2, '{"name": "Son tung Mtp 123", "group_id": "1484818957960478720", "avatar_uri": "data/1516886598732480512/origin/ReactNativecroppedimage1836272115914636176.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519395445695053824, '2022-12-15 04:23:45.821851', '2022-12-15 04:23:45.821851', false, 1495074653155098624, 2, '{"name": "Son tung Mtp 666666666666666", "group_id": "1484818957960478720", "avatar_uri": "data/1516886598732480512/origin/ReactNativecroppedimage1836272115914636176.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519398171925544960, '2022-12-15 04:26:28.313216', '2022-12-15 04:26:28.313216', false, 1495074653155098624, 2, '{"name": "taaaaaa 123d", "group_id": "1480125322757144576", "avatar_uri": "data/1516859837076471808/origin/ReactNativecroppedimage3184619935365064561.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1468926266534002688, '2022-11-10 08:47:08.345447', '2022-11-10 08:47:08.345447', false, 1459808658098487296, 1, '{"name": "Son tung Mtp", "group_id": "1468926264722063360", "avatar_uri": "data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1468552538260242432, '2022-11-10 02:35:52.381794', '2022-11-10 02:35:52.381794', false, 1459808658098487296, 2, '{"name": "Cà phê", "group_id": "1449807456946356224", "avatar_uri": "data/1450206485815492608/origin/5.png"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1484818965225013248, '2022-11-21 07:55:07.032531', '2022-11-21 07:55:07.032531', false, 1459808658098487296, 1, '{"name": "Son tung Mtp", "group_id": "1484818957960478720", "avatar_uri": "data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg"}', 3);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1510546437316804608, '2022-12-09 01:53:03.82066', '2022-12-09 01:53:03.82066', false, 1495074653155098624, 1, '{"name": "12312d", "group_id": "1510546437065146368"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519332664849465344, '2022-12-15 03:21:23.792317', '2022-12-15 03:21:23.792317', false, 1495074653155098624, 2, '{"name": "CLB Liên quân mobile 3333", "group_id": "1414978702227411200", "avatar_uri": "data/1516827856330555392/origin/ReactNativecroppedimage5591382654112658606.jpg"}', 2);
INSERT INTO public.social_user_approve (id, created_at, updated_at, deleted_flg, user_id, type, review_content, status) VALUES (1519540459796430848, '2022-12-15 06:47:49.331069', '2022-12-15 06:47:49.331069', false, 1495074653155098624, 2, '{"name": "taaaaaa 123", "group_id": "1480125322757144576", "avatar_uri": "data/1516859837076471808/origin/ReactNativecroppedimage3184619935365064561.jpg"}', 2);


--
-- Data for Name: social_user_bi_level; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_user_bi_level (id, created_at, updated_at, deleted_flg, bi_level_id, user_id, bi_level) VALUES (1549812155228880896, '2023-01-04 14:45:03.696135', '2023-01-05 04:00:02.999215', false, 1, 1549002107938406400, 2236);
INSERT INTO public.social_user_bi_level (id, created_at, updated_at, deleted_flg, bi_level_id, user_id, bi_level) VALUES (1549812155983921152, '2023-01-05 02:25:03.276001', '2023-01-05 04:00:03.030052', false, 1, 1549711419404976128, 4.5);
INSERT INTO public.social_user_bi_level (id, created_at, updated_at, deleted_flg, bi_level_id, user_id, bi_level) VALUES (1549812156202024960, '2023-01-04 14:45:03.71998', '2023-01-05 04:00:03.041968', false, 1, 1549002106059358208, 6);
INSERT INTO public.social_user_bi_level (id, created_at, updated_at, deleted_flg, bi_level_id, user_id, bi_level) VALUES (1549812156369797120, '2023-01-05 02:25:03.294823', '2023-01-05 04:00:03.052478', false, 1, 1549711423280513024, 3.5);


--
-- Data for Name: social_user_block; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_user_block (id, created_at, updated_at, deleted_flg, user_id, target_id) VALUES (1444003022671198208, '2022-10-31 07:32:13.678403', '2022-10-31 08:07:29.377068', false, 1234, 1449963012961075200);


--
-- Data for Name: social_user_friend; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_user_friend (id, created_at, updated_at, user_id, friend_id, source, status) VALUES (1423614782172485024, '2022-10-31 07:04:55.197024', '2022-10-31 07:06:11.867373', 1449963012961075200, 1234, 10, 20);
INSERT INTO public.social_user_friend (id, created_at, updated_at, user_id, friend_id, source, status) VALUES (1423614782172785024, '2022-10-31 07:04:55.197024', '2022-10-31 07:22:54.88447', 1234, 1449963012961075200, 10, 10);
INSERT INTO public.social_user_friend (id, created_at, updated_at, user_id, friend_id, source, status) VALUES (1459883127563354113, '2022-11-04 03:16:50.817897', '2022-11-04 03:16:50.817897', 1459883127563354112, 1459882924844253184, 10, 20);
INSERT INTO public.social_user_friend (id, created_at, updated_at, user_id, friend_id, source, status) VALUES (1459883127563354114, '2022-11-04 03:17:01.699595', '2022-11-04 03:17:01.699595', 1459882924844253184, 1459883127563354112, 10, 20);
INSERT INTO public.social_user_friend (id, created_at, updated_at, user_id, friend_id, source, status) VALUES (1459883127563354115, '2022-11-04 03:17:57.277196', '2022-11-04 03:17:57.277196', 1459883127563354112, 1459874675352928256, 10, 20);
INSERT INTO public.social_user_friend (id, created_at, updated_at, user_id, friend_id, source, status) VALUES (1459883127563354116, '2022-11-04 03:18:06.760115', '2022-11-04 03:18:06.760115', 1459874675352928256, 1459883127563354112, 10, 20);


--
-- Data for Name: social_user_notices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (121, '2022-10-12 11:22:00.033049', '2022-10-12 11:22:00.033049', false, '2022-10-12 11:22:00.033049', NULL, 21313, 'sasa', '1213', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1465705621989883904, '2022-11-08 03:27:43.110988', '2022-11-08 03:27:43.110988', false, '2022-11-08 03:27:42.962', NULL, 1416363472194633728, '', 'NULL vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1465705828165091328, '2022-11-08 03:27:55.254556', '2022-11-08 03:27:55.254556', false, '2022-11-08 03:27:55.238', NULL, 1416363472194633728, '', 'NULL đã like bài viết của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1465717040227549184, '2022-11-08 03:39:03.587939', '2022-11-08 03:39:03.587939', false, '2022-11-08 03:39:03.524', NULL, 1459883127563354112, '2022-11-08T03:39:03.476Z', 'THIEN TEST NOTICE', 'data/1465690200976916480/origin/2.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1465717040261103616, '2022-11-08 03:39:03.603349', '2022-11-08 03:39:03.603349', false, '2022-11-08 03:39:03.526', NULL, 1459882924844253184, '2022-11-08T03:39:03.476Z', 'THIEN TEST NOTICE', 'data/1465690200976916480/origin/2.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1465717194762485760, '2022-11-08 03:39:12.737604', '2022-11-08 03:39:12.737604', false, '2022-11-08 03:39:12.735', NULL, 1459883127563354112, '2022-11-08T03:39:12.731Z', 'THIEN TEST NOTICE', 'data/1465690200976916480/origin/2.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1465717194762551296, '2022-11-08 03:39:12.738653', '2022-11-08 03:39:12.738653', false, '2022-11-08 03:39:12.735', NULL, 1459882924844253184, '2022-11-08T03:39:12.731Z', 'THIEN TEST NOTICE', 'data/1465690200976916480/origin/2.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1470512137976676352, '2022-11-11 11:02:33.706877', '2022-11-11 11:02:33.706877', false, '2022-11-11 11:02:33.622', NULL, 1449767698836750336, 'Tieu de', 'Noi dung', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1470512138312220672, '2022-11-11 11:02:33.715106', '2022-11-11 11:02:33.715106', false, '2022-11-11 11:02:33.642', NULL, 1449767698836750336, 'Tieu de', 'Noi dung', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1470512138479992832, '2022-11-11 11:02:33.719351', '2022-11-11 11:02:33.719351', false, '2022-11-11 11:02:33.652', NULL, 1449767698836750336, 'Tieu de', 'Noi dung', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1470512211964198912, '2022-11-11 11:02:38.046825', '2022-11-11 11:02:38.046825', false, '2022-11-11 11:02:38.032', NULL, 1449767698836750336, 'Tieu de', 'Noi dung', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1470513150297112576, '2022-11-11 11:03:34.032056', '2022-11-11 11:03:34.032056', false, '2022-11-11 11:03:33.962', NULL, 1449767698836750336, 'Tieu de', 'Noi dung', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1474778453696839680, '2022-11-14 09:40:45.897387', '2022-11-14 09:40:45.897387', false, '2022-11-14 09:40:45.855', NULL, 1415324996598759424, 'asdasdasd', 'dadasdsad', 'data/1474777154720890880/origin/algolia.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1474778656214614016, '2022-11-14 09:40:57.931188', '2022-11-14 09:40:57.931188', false, '2022-11-14 09:40:57.926', NULL, 1415324996598759424, 'sdasd', 'asdasdasd', 'data/1474778636937592832/origin/algolia.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1474779107572056064, '2022-11-14 09:41:24.854369', '2022-11-14 09:41:24.854369', false, '2022-11-14 09:41:24.831', NULL, 1415324996598759424, 'anh em cuuu', 'cuuuu', 'data/1474779089872093184/origin/algolia.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1474789861012537344, '2022-11-14 09:52:05.831452', '2022-11-14 09:52:05.831452', false, '2022-11-14 09:52:05.784', NULL, 1415324996598759424, 'con ga mai day', 'chicken', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1475737328113680384, '2022-11-15 01:33:19.292955', '2022-11-15 01:33:19.292955', false, '2022-11-15 01:33:19.25', NULL, 1415324996598759424, 'ticktok', 'Trung Quoc', 'data/1475737308132016128/origin/guay1removebgpreview.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1475752486328336384, '2022-11-15 01:48:22.749681', '2022-11-15 01:48:22.749681', false, '2022-11-15 01:48:22.724', NULL, 1415324996598759424, 'alo', 'alo', 'data/1475752453008785408/origin/algolia.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1475754514106548224, '2022-11-15 01:50:23.614441', '2022-11-15 01:50:23.614441', false, '2022-11-15 01:50:23.589', NULL, 1415324996598759424, '31223', '123', 'data/1475754498738618368/origin/default.jpg');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1475759998410686464, '2022-11-15 01:55:50.536233', '2022-11-15 01:55:50.536233', false, '2022-11-15 01:55:50.482', NULL, 1415324996598759424, 'nice', 'nice', 'data/1475759983697068032/origin/default.jpg');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1477509310891163648, '2022-11-16 06:53:37.717692', '2022-11-16 06:53:37.717692', false, '2022-11-16 06:53:37.628', NULL, 1415324996598759424, 'a2323', '33453454', 'data/1477509254200950784/origin/202211161353.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1477562003177340928, '2022-11-16 07:45:58.358228', '2022-11-16 07:45:58.358228', false, '2022-11-16 07:45:58.333', NULL, 1415324996598759424, '334', '32344353', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1480123974640730112, '2022-11-18 02:11:03.788823', '2022-11-18 02:11:03.788823', false, '2022-11-18 02:11:03.733', NULL, 1415324996598759424, 'Phương Băng,Mộc Nhiên,Minh Đức ', 'Phương Băng,Mộc Nhiên,Minh Đức ', 'data/1480123954826838016/origin/guay1removebgpreview.png');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1517932993878949888, '2022-12-14 04:10:57.022205', '2022-12-14 04:10:57.022205', false, '2022-12-14 04:10:56.893', NULL, 1415324996598759424, '12312312312', '3123123213123123', 'data/1517932978527797248/origin/2fashionbanner1.jpg');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518167159421796352, '2022-12-14 08:03:34.293138', '2022-12-14 08:03:34.293138', false, '2022-12-14 08:03:34.253', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518169210134462464, '2022-12-14 08:05:36.519211', '2022-12-14 08:05:36.519211', false, '2022-12-14 08:05:36.484', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518171430649331712, '2022-12-14 08:07:48.871724', '2022-12-14 08:07:48.871724', false, '2022-12-14 08:07:48.838', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518175189400027136, '2022-12-14 08:11:32.95231', '2022-12-14 08:11:32.95231', false, '2022-12-14 08:11:32.874', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518198582543384576, '2022-12-14 08:34:47.238901', '2022-12-14 08:34:47.238901', false, '2022-12-14 08:34:47.217', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518200827183890432, '2022-12-14 08:37:01.039092', '2022-12-14 08:37:01.039092', false, '2022-12-14 08:37:01.008', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518200944020422656, '2022-12-14 08:37:07.992396', '2022-12-14 08:37:07.992396', false, '2022-12-14 08:37:07.982', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518202626959736832, '2022-12-14 08:38:48.30361', '2022-12-14 08:38:48.30361', false, '2022-12-14 08:38:48.28', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518202850851684352, '2022-12-14 08:39:01.64595', '2022-12-14 08:39:01.64595', false, '2022-12-14 08:39:01.632', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518203811431186432, '2022-12-14 08:39:58.921387', '2022-12-14 08:39:58.921387', false, '2022-12-14 08:39:58.883', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518204217439813632, '2022-12-14 08:40:23.100192', '2022-12-14 08:40:23.100192', false, '2022-12-14 08:40:23.085', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518204545702821888, '2022-12-14 08:40:42.670864', '2022-12-14 08:40:42.670864', false, '2022-12-14 08:40:42.647', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518205040228040704, '2022-12-14 08:41:12.157937', '2022-12-14 08:41:12.157937', false, '2022-12-14 08:41:12.147', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1518205170637340672, '2022-12-14 08:41:19.907848', '2022-12-14 08:41:19.907848', false, '2022-12-14 08:41:19.899', NULL, 1495074653155098624, '', 'undefined vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1519789857507901440, '2022-12-15 10:55:34.682904', '2022-12-15 10:55:34.682904', false, '2022-12-15 10:55:34.604', NULL, 1416363472194633728, '', 'NULL vừa bình luận bài đăng của bạn.', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1528328692541947904, '2022-12-21 08:18:08.881585', '2022-12-21 08:18:08.881585', false, '2022-12-21 08:18:08.819', NULL, 1415324996598759424, 'may noi tuc qua', 'may noi tuc qua', NULL);
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1539670040830279680, '2022-12-29 04:04:45.94373', '2022-12-29 04:04:45.94373', false, '2022-12-29 04:04:45.856', NULL, 1415324996598759424, '1231', '23123123', 'data/1539670000682401792/origin/img17.jpg');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1539673533813096448, '2022-12-29 04:08:14.096592', '2022-12-29 04:08:14.096592', false, '2022-12-29 04:08:14.053', NULL, 1415324996598759424, '12312', '3123123123', 'data/1539673501969940480/origin/img17.jpg');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1539674369033240576, '2022-12-29 04:09:03.871909', '2022-12-29 04:09:03.871909', false, '2022-12-29 04:09:03.837', NULL, 1415324996598759424, '22222', '22322222', 'data/1539674330227539968/origin/img17.jpg');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1539680218090831872, '2022-12-29 04:14:52.507501', '2022-12-29 04:14:52.507501', false, '2022-12-29 04:14:52.467', NULL, 1415324996598759424, '1231232312', '3123123123123', 'data/1539680186549665792/origin/img17.jpg');
INSERT INTO public.social_user_notices (id, created_at, updated_at, deleted_flg, send_at, read_at, user_id, title, content, media_uri) VALUES (1539680711022215168, '2022-12-29 04:15:21.856634', '2022-12-29 04:15:21.856634', false, '2022-12-29 04:15:21.848', NULL, 1415324996598759424, '1231231', '23123123123', 'data/1539680681443983360/origin/logo.png');


--
-- Data for Name: social_users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1234, '2022-10-24 02:06:33.813465', '2022-10-24 02:06:33.813465', false, 'o#85024', 'sNguyễn Long Đăngs dep trai  o o o', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '0389747179', '', '1999-12-04', NULL, 1, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459883127563354112, '2022-11-04 03:03:35.235231', '2023-01-05 02:42:48.969437', false, 'test#54112', 'Social Test 2', 'PR RR', '', NULL, '0707000112', NULL, '2022-11-01', NULL, 2, 2, 'null', NULL, 149, 2507);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633700, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'haha#85024', 'Test 1', NULL, 'data/1439981060174643200/origin/user03.jpg', NULL, '09088979783', 'longdang1@gmail.com', '1991-12-04', NULL, 2, 3, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633701, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'hihi#85024', 'Test 2', NULL, 'data/1439981060174643200/origin/user03.jpg', NULL, '09088979784', 'longdang2@gmail.com', '1991-12-04', NULL, 2, 2, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633702, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'hehe#85024', 'Test 3', NULL, 'data/1439981060174643200/origin/user03.jpg', NULL, '090889797846', 'longdang5@gmail.com', '1991-12-04', NULL, 2, 1, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633703, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'hjhj#85024', 'Test 4', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '09088979788', 'longdang6@gmail.com', '1991-12-04', NULL, 2, 1, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633800, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'mimi#85024', 'Test 5', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '09088979744', 'longdang00@gmail.com', '1991-12-04', NULL, 2, 1, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633801, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'maia#85764', 'Test 6', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '09088979747', 'longdang01@gmail.com', '1991-12-04', NULL, 1, 1, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633802, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'maia#12355', 'Test 33', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '09088979741', 'longdang02@gmail.com', '1991-12-04', NULL, 1, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633803, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'aabc#12355', 'Test 44', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '09088979764', 'longdang03@gmail.com', '1991-12-04', NULL, 1, 3, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633804, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'aabc#16785', 'Test 55', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '09088971764', 'longdang04@gmail.com', '1991-12-04', NULL, 1, 2, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1416363472194633805, '2022-10-24 07:17:25.887137', '2022-10-27 03:13:49.639218', false, 'dddd#16785', 'Test 66', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '09088971761', 'longdang05@gmail.com', '1991-12-04', NULL, 1, 2, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449768760297652224, '2022-10-28 03:35:52.014665', '2022-10-28 03:35:52.014665', false, 'test#52224', 'Thien Test', NULL, NULL, NULL, '03125361212', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449811397092311040, '2022-10-28 04:18:13.37906', '2022-10-28 04:18:13.37906', false, 'test#11040', 'Thien Test', NULL, NULL, NULL, '03125361216', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449812267645272064, '2022-10-28 04:19:05.347368', '2022-10-28 04:19:05.347368', false, 'test#72064', 'Thien Test', NULL, NULL, NULL, '03125361217', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449813008292249600, '2022-10-28 04:19:49.443206', '2022-10-28 04:19:49.443206', false, 'test#49600', 'Thien Test', NULL, NULL, NULL, '03125361218', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449814226670452736, '2022-10-28 04:21:02.077628', '2022-10-28 04:21:02.077628', false, 'test#52736', 'Thien Test', NULL, NULL, NULL, '03125361219', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449814936497684480, '2022-10-28 04:21:44.38518', '2022-10-28 04:21:44.38518', false, 'test#84480', 'Thien Test', NULL, NULL, NULL, '03125361220', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449962182790873088, '2022-10-28 06:48:01.195392', '2022-10-28 06:48:01.195392', false, 'test#73088', 'Thien Test', NULL, NULL, NULL, '03125361225', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449963012961075200, '2022-10-28 06:48:50.423495', '2022-11-03 04:28:48.836016', false, 'test#75200', 'Thien Test', NULL, 'data/1434158938420412416/origin/6d0e7a55f64bf01665482413407.jpg', NULL, '03125361226', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459808658098487296, '2022-11-04 01:49:36.74272', '2022-11-04 01:49:36.74272', false, 'social#87296', 'Long Đăng social', NULL, NULL, NULL, '03940490102', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459871788547702784, '2022-11-04 02:52:19.409263', '2022-11-04 03:02:35.05529', true, 'test#02784', 'Test 23432534', NULL, NULL, NULL, '09876543412', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459865093314445312, '2022-11-04 02:45:40.421486', '2022-11-04 03:02:40.837915', true, 'test#45312', 'Test 33334', NULL, NULL, NULL, '09876543456', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459864210648334336, '2022-11-04 02:44:47.698779', '2022-11-04 03:02:44.811552', true, 'test#34336', 'TESt 33333', NULL, NULL, NULL, '13123123237', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459858987280236544, '2022-11-04 02:39:36.38342', '2022-11-04 03:02:47.615267', true, 'test#36544', 'TEst 23', NULL, NULL, NULL, '56456542111', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459856258449276928, '2022-11-04 02:36:53.745442', '2022-11-04 03:02:50.412489', true, 'test#76928', 'Test', NULL, NULL, NULL, '03393829222', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1529759273586786304, '2022-12-22 07:59:18.327932', '2022-12-22 07:59:18.327932', false, 'qfasda#86304', 'qfasdasd', NULL, NULL, NULL, '0793246234', NULL, '2022-12-08', NULL, 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459874675352928256, '2022-11-04 02:55:11.510707', '2023-01-05 03:52:39.076716', false, 'test#28256', 'Social Test 1234 5 889', NULL, NULL, NULL, '0909090822', NULL, NULL, NULL, 2, 3, 'null', NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1480403472388980736, '2022-11-18 06:48:43.197787', '2022-11-18 06:48:43.197787', false, 'test#80736', 'Đăng Test 1', NULL, NULL, NULL, '0905839372', NULL, '2022-11-01', NULL, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1480403881501392896, '2022-11-18 06:49:07.516375', '2022-11-18 06:49:07.516375', false, 'test#92896', 'Đăng Test 2', NULL, NULL, NULL, '0909084442', NULL, '2022-11-02', NULL, 2, 5, NULL, NULL, 156, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1480404251623555072, '2022-11-18 06:49:29.569618', '2022-11-18 06:49:29.569618', false, 'test#55072', 'Đăng Test 3', NULL, NULL, NULL, '0808048332', NULL, '2022-11-03', NULL, 1, 5, NULL, NULL, 156, 2568);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1415324996598759424, '2022-10-04 09:19:03.676498', '2023-01-05 04:06:47.263025', false, 'aloooo#59424', 'Nhat  alooooooooooooooooo', NULL, '', NULL, '0798805722', NULL, NULL, NULL, 1, 3, 'null', NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1449767698836750336, '2022-10-28 03:34:48.709869', '2022-11-21 02:47:03.250922', false, 'test#50336', 'Thien Test CDC', NULL, 'data/1465692990205853696/origin/1.png', NULL, '03125361211', NULL, '2022-10-13', NULL, 2, 5, NULL, NULL, 179, 2762);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1414963409643896832, '2022-12-08 07:56:31.987657', '2022-12-08 07:56:31.987657', false, 'fuck#96832', 'Fuck', NULL, NULL, NULL, '+84353940862', NULL, '1988-01-01', NULL, 1, 1, NULL, NULL, 108, 2070);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1495074653155098624, '2022-11-28 09:43:13.631186', '2023-01-05 04:25:01.38953', false, 'update#98624', 'Dagn update 1', NULL, '', NULL, '0777031044', NULL, '1995-01-01', NULL, 2, 2, 'null', NULL, 156, 2080);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1459882924844253184, '2022-11-04 03:03:23.158962', '2022-12-27 03:33:28.795725', false, 'ddd#53184', 'Social 12222 ddd', NULL, NULL, NULL, '0984913742', NULL, NULL, NULL, 1, 3, 'null', NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548294347156357120, '2023-01-04 02:52:14.700244', '2023-01-04 02:52:14.700244', false, 'user#57120', 'User 0123121412', NULL, NULL, NULL, '0123121412', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548294347491901440, '2023-01-04 02:52:14.704097', '2023-01-04 02:52:14.704097', false, 'user#01440', 'User 0124234234', NULL, NULL, NULL, '0124234234', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548311276709478400, '2023-01-04 03:09:03.728289', '2023-01-04 03:09:03.728289', false, 'user#78400', 'User 0123121413', NULL, NULL, NULL, '0123121413', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548311277229572096, '2023-01-04 03:09:03.730407', '2023-01-04 03:09:03.730407', false, 'user#72096', 'User 0124234235', NULL, NULL, NULL, '0124234235', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548315915156717568, '2023-01-04 03:13:40.2071', '2023-01-04 03:13:40.2071', false, 'user#17568', 'User 0123121414', NULL, NULL, NULL, '0123121414', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548315915710365696, '2023-01-04 03:13:40.211611', '2023-01-04 03:13:40.211611', false, 'user#65696', 'User 0124234237', NULL, NULL, NULL, '0124234237', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548317779038306304, '2023-01-04 03:15:31.270575', '2023-01-04 03:15:31.270575', false, 'user#06304', 'User 0123121419', NULL, NULL, NULL, '0123121419', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548317784541233152, '2023-01-04 03:15:31.563257', '2023-01-04 03:15:31.563257', false, 'user#33152', 'User 0124234238', NULL, NULL, NULL, '0124234238', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548320793501368320, '2023-01-04 03:18:30.955075', '2023-01-04 03:18:30.955075', false, 'user#68320', 'User 0123151419', NULL, NULL, NULL, '0123151419', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548320798215766016, '2023-01-04 03:18:31.199035', '2023-01-04 03:18:31.199035', false, 'user#66016', 'User 0124232238', NULL, NULL, NULL, '0124232238', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548327723498209280, '2023-01-04 03:25:24.027919', '2023-01-04 03:25:24.027919', false, 'user#09280', 'User 0323151419', NULL, NULL, NULL, '0323151419', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548327728632037376, '2023-01-04 03:25:24.2762', '2023-01-04 03:25:24.2762', false, 'user#37376', 'User 0324232238', NULL, NULL, NULL, '0324232238', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548340480238944256, '2023-01-04 03:38:04.382302', '2023-01-04 03:38:04.382302', false, 'user#44256', 'User 0343874893', NULL, NULL, NULL, '0343874893', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548341566429462528, '2023-01-04 03:39:09.104731', '2023-01-04 03:39:09.104731', false, 'user#62528', 'User 0324325486', NULL, NULL, NULL, '0324325486', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548341568795049984, '2023-01-04 03:39:09.209998', '2023-01-04 03:39:09.209998', false, 'user#49984', 'User 0648594874', NULL, NULL, NULL, '0648594874', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548430261597765632, '2023-01-04 05:07:15.787556', '2023-01-04 05:07:15.787556', false, 'user#65632', 'User 0142312231', NULL, NULL, NULL, '0142312231', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548549185937080320, '2023-01-04 07:05:24.215733', '2023-01-04 07:05:24.215733', false, 'user#80320', 'User 0144232131', NULL, NULL, NULL, '0144232131', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548618327377575936, '2023-01-04 08:14:05.360129', '2023-01-04 08:14:05.360129', false, 'user#75936', 'User 0124131231', NULL, NULL, NULL, '0124131231', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548642204828827648, '2023-01-04 08:37:48.590446', '2023-01-04 08:37:48.590446', false, 'user#27648', 'User 0424345364', NULL, NULL, NULL, '0424345364', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548759559391150080, '2023-01-04 10:34:23.459276', '2023-01-04 10:34:23.459276', false, 'o#50080', 'Dang o o o o o o o', NULL, NULL, NULL, '0930383921', NULL, '2023-01-12', NULL, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548792822805561344, '2023-01-04 11:07:26.165568', '2023-01-04 11:07:26.165568', false, 'user#61344', 'User 0622201445', NULL, NULL, NULL, '0622201445', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548882527593168896, '2023-01-04 12:36:32.920802', '2023-01-04 12:36:32.920802', false, 'user#68896', 'User 0457555866', NULL, NULL, NULL, '0457555866', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548900107364073472, '2023-01-04 12:54:00.75619', '2023-01-04 12:54:00.75619', false, 'user#73472', 'User 0142142412', NULL, NULL, NULL, '0142142412', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548942091273371648, '2023-01-04 13:35:43.201655', '2023-01-04 13:35:43.201655', false, 'user#71648', 'User 0242198209', NULL, NULL, NULL, '0242198209', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548958018773712896, '2023-01-04 13:51:32.540255', '2023-01-04 13:51:32.540255', false, 'user#12896', 'User 0343434343', NULL, NULL, NULL, '0343434343', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548993557916811264, '2023-01-04 14:26:50.818', '2023-01-04 14:26:50.818', false, 'user#11264', 'User 0121213131', NULL, NULL, NULL, '0121213131', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548995225790185472, '2023-01-04 14:28:30.238236', '2023-01-04 14:28:30.238236', false, 'user#85472', 'User 0123123123', NULL, NULL, NULL, '0123123123', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1548995632604119040, '2023-01-04 14:28:54.468112', '2023-01-04 14:28:54.468112', false, 'user#19040', 'User 0635695566', NULL, NULL, NULL, '0635695566', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1549000183927275520, '2023-01-04 14:33:25.772004', '2023-01-04 14:33:25.772004', false, 'user#75520', 'User 0123124141', NULL, NULL, NULL, '0123124141', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1549000188910108672, '2023-01-04 14:33:26.02721', '2023-01-04 14:33:26.02721', false, 'user#08672', 'User 0144212414', NULL, NULL, NULL, '0144212414', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1549002106059358208, '2023-01-04 14:35:20.332334', '2023-01-04 14:35:20.332334', false, 'user#58208', 'User 0123123121', NULL, NULL, NULL, '0123123121', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1549002107938406400, '2023-01-04 14:35:20.421342', '2023-01-04 14:35:20.421342', false, 'user#06400', 'User 0142141323', NULL, NULL, NULL, '0142141323', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1549711423280513024, '2023-01-05 02:19:58.891064', '2023-01-05 03:56:31.926679', false, 'user#13024', 'User 0635889976', 'sss', 'data/1549808561985421312/origin/10.png', NULL, '0335889976', NULL, '2020-01-13', NULL, 1, 5, 'null', NULL, 108, 2070);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1549711419404976128, '2023-01-05 02:19:58.659907', '2023-01-05 03:57:23.498584', true, 'user#76128', 'User 0554565589', NULL, NULL, NULL, '0554565589', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550006076559065088, '2023-01-05 07:12:41.698538', '2023-01-05 07:12:41.698538', false, 'user#65088', 'User 0412312312', NULL, NULL, NULL, '0412312312', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550030806108340224, '2023-01-05 07:37:15.636488', '2023-01-05 07:37:15.636488', false, 'user#40224', 'User 0333333333', NULL, NULL, NULL, '0333333333', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550030809228902400, '2023-01-05 07:37:15.793199', '2023-01-05 07:37:15.793199', false, 'user#02400', 'User 0222222222', NULL, NULL, NULL, '0222222222', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550039228975415296, '2023-01-05 07:45:37.682606', '2023-01-05 07:45:37.682606', false, 'user#15296', 'User 0555555555', NULL, NULL, NULL, '0555555555', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550039232683180032, '2023-01-05 07:45:37.859702', '2023-01-05 07:45:37.859702', false, 'user#80032', 'User 0312321421', NULL, NULL, NULL, '0312321421', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550205280917127168, '2023-01-05 10:30:35.145935', '2023-01-05 10:30:35.145935', false, 'user#27168', 'User 0124242342', NULL, NULL, NULL, '0124242342', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550251305484681216, '2023-01-05 11:16:18.428709', '2023-01-05 11:16:18.428709', false, 'user#81216', 'User 0410451542', NULL, NULL, NULL, '0410451542', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1550251308823347200, '2023-01-05 11:16:18.620047', '2023-01-05 11:16:18.620047', false, 'user#47200', 'User 0859989898', NULL, NULL, NULL, '0859989898', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1551653633630666752, '2023-01-06 10:29:23.73642', '2023-01-06 10:29:23.73642', false, 'user#66752', 'User 0234234234', NULL, NULL, NULL, '0234234234', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1551662482051825664, '2023-01-06 10:38:11.137385', '2023-01-06 10:38:11.137385', false, 'user#25664', 'User 0534534534', NULL, NULL, NULL, '0534534534', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1555947337602301952, '2023-01-09 09:34:48.401809', '2023-01-09 09:34:48.401809', false, 'user#01952', 'User 0215467894', NULL, NULL, NULL, '0215467894', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1555947345403707392, '2023-01-09 09:34:48.822559', '2023-01-09 09:34:48.822559', false, 'user#07392', 'User 0646158454', NULL, NULL, NULL, '0646158454', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1558566263402266624, '2023-01-11 04:56:28.599628', '2023-01-11 04:56:28.599628', false, 'kokon#66624', 'kokon', NULL, NULL, NULL, '0909214123', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1558574283632934912, '2023-01-11 05:04:26.582927', '2023-01-11 05:04:26.582927', false, 'user#34912', 'User 0659696396', NULL, NULL, NULL, '0659696396', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1558574289370742784, '2023-01-11 05:04:26.887355', '2023-01-11 05:04:26.887355', false, 'user#42784', 'User 0695892866', NULL, NULL, NULL, '0695892866', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1559972123487764480, '2023-01-12 04:13:04.323683', '2023-01-12 04:13:04.323683', false, 'user#64480', 'User 0342342342', NULL, NULL, NULL, '0342342342', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1559972126188896256, '2023-01-12 04:13:04.451995', '2023-01-12 04:13:04.451995', false, 'user#96256', 'User 0143123213', NULL, NULL, NULL, '0143123213', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1560245347328983040, '2023-01-12 08:44:29.730624', '2023-01-12 08:44:29.730624', false, 'user#83040', 'User 0142552104', NULL, NULL, NULL, '0142552104', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1560245351372292096, '2023-01-12 08:44:29.968961', '2023-01-12 08:44:29.968961', false, 'user#92096', 'User 0221050521', NULL, NULL, NULL, '0221050521', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1560299453716365312, '2023-01-12 09:38:14.721415', '2023-01-12 09:38:14.721415', false, 'user#65312', 'User 0425426924', NULL, NULL, NULL, '0425426924', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1560299462759284736, '2023-01-12 09:38:15.228518', '2023-01-12 09:38:15.228518', false, 'user#84736', 'User 0549549545', NULL, NULL, NULL, '0549549545', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1560313968826777600, '2023-01-12 09:52:39.889737', '2023-01-12 09:52:39.889737', false, 'user#77600', 'User 0444444444', NULL, NULL, NULL, '0444444444', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1560511946938122240, '2023-01-12 13:09:20.309596', '2023-01-12 13:09:20.309596', false, 'user#22240', 'User 0999466455', NULL, NULL, NULL, '0999466455', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1560511947911200768, '2023-01-12 13:09:20.332319', '2023-01-12 13:09:20.332319', false, 'user#00768', 'User 0643984856', NULL, NULL, NULL, '0643984856', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1561445452425986048, '2023-01-13 04:36:41.573653', '2023-01-13 04:36:41.573653', false, 'user#86048', 'User 0234324234', NULL, NULL, NULL, '0234324234', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1561445456385409024, '2023-01-13 04:36:41.772893', '2023-01-13 04:36:41.772893', false, 'user#09024', 'User 0334335453', NULL, NULL, NULL, '0334335453', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1565979881429270528, '2023-01-16 07:41:14.741104', '2023-01-16 07:41:14.741104', false, 'user#70528', 'User 0111111111', NULL, NULL, NULL, '0111111111', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1566038198360997888, '2023-01-16 08:39:10.568952', '2023-01-16 08:39:10.568952', false, 'user#97888', 'User 0345345354', NULL, NULL, NULL, '0345345354', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1566038204417572864, '2023-01-16 08:39:10.890413', '2023-01-16 08:39:10.890413', false, 'user#72864', 'User 0785674725', NULL, NULL, NULL, '0785674725', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1566128263841972224, '2023-01-16 10:08:38.898039', '2023-01-16 10:08:38.898039', false, 'user#72224', 'User 0345345345', NULL, NULL, NULL, '0345345345', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1566128269613334528, '2023-01-16 10:08:39.189322', '2023-01-16 10:08:39.189322', false, 'user#34528', 'User 0345345435', NULL, NULL, NULL, '0345345435', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1566162784473841664, '2023-01-16 10:42:56.481633', '2023-01-16 10:42:56.481633', false, 'user#41664', 'User 0787698797', NULL, NULL, NULL, '0787698797', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1566162790396198912, '2023-01-16 10:42:56.806953', '2023-01-16 10:42:56.806953', false, 'user#98912', 'User 0657657687', NULL, NULL, NULL, '0657657687', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567181459582615552, '2023-01-17 03:34:54.266626', '2023-01-17 03:34:54.266626', false, 'user#15552', 'User 0676768768', NULL, NULL, NULL, '0676768768', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567181461092564992, '2023-01-17 03:34:54.294397', '2023-01-17 03:34:54.294397', false, 'user#64992', 'User 0768768756', NULL, NULL, NULL, '0768768756', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567183354468499456, '2023-01-17 03:36:47.180713', '2023-01-17 03:36:47.180713', false, 'user#99456', 'User 0223456786', NULL, NULL, NULL, '0223456786', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567183355357691904, '2023-01-17 03:36:47.205229', '2023-01-17 03:36:47.205229', false, 'user#91904', 'User 0454544354', NULL, NULL, NULL, '0454544354', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567238679636738048, '2023-01-17 04:31:44.830425', '2023-01-17 04:31:44.830425', false, 'user#38048', 'User 0909808998', NULL, NULL, NULL, '0909808998', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567238687404589056, '2023-01-17 04:31:45.253019', '2023-01-17 04:31:45.253019', false, 'user#89056', 'User 0787687686', NULL, NULL, NULL, '0787687686', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567240496357572608, '2023-01-17 04:33:33.097619', '2023-01-17 04:33:33.097619', false, 'user#72608', 'User 0756576576', NULL, NULL, NULL, '0756576576', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567240501373960192, '2023-01-17 04:33:33.370276', '2023-01-17 04:33:33.370276', false, 'user#60192', 'User 0758769879', NULL, NULL, NULL, '0758769879', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567241183938215936, '2023-01-17 04:34:14.081006', '2023-01-17 04:34:14.081006', false, 'user#15936', 'User 0768768768', NULL, NULL, NULL, '0768768768', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567241188937826304, '2023-01-17 04:34:14.357541', '2023-01-17 04:34:14.357541', false, 'user#26304', 'User 0797897897', NULL, NULL, NULL, '0797897897', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567533252904747008, '2023-01-17 09:24:22.767934', '2023-01-17 09:24:22.767934', false, 'user#47008', 'User 0564534534', NULL, NULL, NULL, '0564534534', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1567533256377630720, '2023-01-17 09:24:22.928655', '2023-01-17 09:24:22.928655', false, 'user#30720', 'User 0768987687', NULL, NULL, NULL, '0768987687', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1568966146151940096, '2023-01-18 09:07:49.873956', '2023-01-18 09:07:49.873956', false, 'user#40096', 'User 0678656576', NULL, NULL, NULL, '0678656576', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1568966151185104896, '2023-01-18 09:07:50.143715', '2023-01-18 09:07:50.143715', false, 'user#04896', 'User 0768769879', NULL, NULL, NULL, '0768769879', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1570417329282482176, '2023-01-19 09:09:27.134887', '2023-01-19 09:09:27.134887', false, 'user#82176', 'User 0534543534', NULL, NULL, NULL, '0534543534', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1570417333661335552, '2023-01-19 09:09:27.338118', '2023-01-19 09:09:27.338118', false, 'user#35552', 'User 0324324324', NULL, NULL, NULL, '0324324324', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1570443813879545856, '2023-01-19 09:35:45.713876', '2023-01-19 09:35:45.713876', false, 'user#45856', 'User 0324234324', NULL, NULL, NULL, '0324234324', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1585973257490661376, '2023-01-30 02:42:52.701126', '2023-01-30 02:42:52.701126', false, 'user#61376', 'User 0342342432', NULL, NULL, NULL, '0342342432', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1585973266600689664, '2023-01-30 02:42:53.201034', '2023-01-30 02:42:53.201034', false, 'user#89664', 'User 0234242342', NULL, NULL, NULL, '0234242342', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586286851524657152, '2023-01-30 07:54:24.342935', '2023-01-30 07:54:24.342935', false, 'user#57152', 'User 0511511021', NULL, NULL, NULL, '0511511021', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586286855618297856, '2023-01-30 07:54:24.549208', '2023-01-30 07:54:24.549208', false, 'user#97856', 'User 0854445054', NULL, NULL, NULL, '0854445054', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586288610817081344, '2023-01-30 07:56:09.208938', '2023-01-30 07:56:09.208938', false, 'user#81344', 'User 0595594945', NULL, NULL, NULL, '0595594945', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586288614122192896, '2023-01-30 07:56:09.371128', '2023-01-30 07:56:09.371128', false, 'user#92896', 'User 0125245488', NULL, NULL, NULL, '0125245488', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586291015008911360, '2023-01-30 07:58:32.510742', '2023-01-30 07:58:32.510742', false, 'user#11360', 'User 0558845845', NULL, NULL, NULL, '0558845845', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586291019404541952, '2023-01-30 07:58:32.729283', '2023-01-30 07:58:32.729283', false, 'user#41952', 'User 0458484808', NULL, NULL, NULL, '0458484808', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586385593309331456, '2023-01-30 09:32:29.817857', '2023-01-30 09:32:29.817857', false, 'user#31456', 'User 0785797955', NULL, NULL, NULL, '0785797955', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586385599785336832, '2023-01-30 09:32:30.166617', '2023-01-30 09:32:30.166617', false, 'user#36832', 'User 0548494887', NULL, NULL, NULL, '0548494887', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586431283657965568, '2023-01-30 10:17:53.1822', '2023-01-30 10:17:53.1822', false, 'user#65568', 'User 0255840407', NULL, NULL, NULL, '0255840407', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586431285352464384, '2023-01-30 10:17:53.231481', '2023-01-30 10:17:53.231481', false, 'user#64384', 'User 0555425448', NULL, NULL, NULL, '0555425448', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586434516526825472, '2023-01-30 10:21:05.847285', '2023-01-30 10:21:05.847285', false, 'user#25472', 'User 0559559598', NULL, NULL, NULL, '0559559598', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586434519278288896, '2023-01-30 10:21:05.999031', '2023-01-30 10:21:05.999031', false, 'user#88896', 'User 0848578458', NULL, NULL, NULL, '0848578458', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586437315218112512, '2023-01-30 10:23:52.672506', '2023-01-30 10:23:52.672506', false, 'user#12512', 'User 0966568656', NULL, NULL, NULL, '0966568656', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586437324697239552, '2023-01-30 10:23:53.20473', '2023-01-30 10:23:53.20473', false, 'user#39552', 'User 0210122110', NULL, NULL, NULL, '0210122110', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586441436205678592, '2023-01-30 10:27:58.306982', '2023-01-30 10:27:58.306982', false, 'user#78592', 'User 0455041504', NULL, NULL, NULL, '0455041504', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586441439645007872, '2023-01-30 10:27:58.475058', '2023-01-30 10:27:58.475058', false, 'user#07872', 'User 0220510226', NULL, NULL, NULL, '0220510226', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586457462389604352, '2023-01-30 10:43:53.544628', '2023-01-30 10:43:53.544628', false, 'user#04352', 'User 0220501250', NULL, NULL, NULL, '0220501250', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586457464268652544, '2023-01-30 10:43:53.618544', '2023-01-30 10:43:53.618544', false, 'user#52544', 'User 0642206520', NULL, NULL, NULL, '0642206520', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586459696124919808, '2023-01-30 10:46:06.673184', '2023-01-30 10:46:06.673184', false, 'user#19808', 'User 0775455042', NULL, NULL, NULL, '0775455042', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1586459700973535232, '2023-01-30 10:46:06.940163', '2023-01-30 10:46:06.940163', false, 'user#35232', 'User 0220242206', NULL, NULL, NULL, '0220242206', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1587401925077237760, '2023-01-31 02:22:07.896278', '2023-01-31 02:22:07.896278', false, 'user#37760', 'User 0225422604', NULL, NULL, NULL, '0225422604', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1587401931670683648, '2023-01-31 02:22:08.269039', '2023-01-31 02:22:08.269039', false, 'user#83648', 'User 0528210522', NULL, NULL, NULL, '0528210522', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1587443222697738240, '2023-01-31 03:03:09.442261', '2023-01-31 03:03:09.442261', false, 'user#38240', 'User 0559957206', NULL, NULL, NULL, '0559957206', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.social_users (id, created_at, updated_at, deleted_flg, user_code, name, pr, avatar_uri, qrcode_uri, phone, email, birthday, address, gender, status, social_accounts, avatar_uri_temp, province_id, district_id) VALUES (1587443227730903040, '2023-01-31 03:03:09.704866', '2023-01-31 03:03:09.704866', false, 'user#03040', 'User 0412012652', NULL, NULL, NULL, '0412012652', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);


--
-- Data for Name: user_approve; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: social_bi_levels rank_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_bi_levels
    ADD CONSTRAINT rank_id_key UNIQUE (id);


--
-- Name: social_bi_levels rank_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_bi_levels
    ADD CONSTRAINT rank_pkey PRIMARY KEY (id);


--
-- Name: social_chat_groups social_chat_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_chat_groups
    ADD CONSTRAINT social_chat_group_pkey PRIMARY KEY (id);


--
-- Name: social_chat_group_member social_group_chat_member_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_chat_group_member
    ADD CONSTRAINT social_group_chat_member_pkey PRIMARY KEY (id);


--
-- Name: social_chat_group_messages social_group_chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_chat_group_messages
    ADD CONSTRAINT social_group_chat_messages_pkey PRIMARY KEY (id);


--
-- Name: social_group_member social_group_member_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_group_member
    ADD CONSTRAINT social_group_member_pkey PRIMARY KEY (id);


--
-- Name: social_groups social_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_groups
    ADD CONSTRAINT social_groups_pkey PRIMARY KEY (id);


--
-- Name: social_messages social_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_messages
    ADD CONSTRAINT social_messages_pkey PRIMARY KEY (id);


--
-- Name: social_user_notices social_notice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_notices
    ADD CONSTRAINT social_notice_user_pkey PRIMARY KEY (id);


--
-- Name: social_post_comment social_post_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_post_comment
    ADD CONSTRAINT social_post_comment_pkey PRIMARY KEY (id);


--
-- Name: social_post_like social_post_like_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_post_like
    ADD CONSTRAINT social_post_like_pkey PRIMARY KEY (user_id, post_id);


--
-- Name: social_posts social_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_posts
    ADD CONSTRAINT social_posts_pkey PRIMARY KEY (id);


--
-- Name: social_regions social_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_regions
    ADD CONSTRAINT social_regions_pkey PRIMARY KEY (id);


--
-- Name: social_rosters social_roster_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_rosters
    ADD CONSTRAINT social_roster_pkey PRIMARY KEY (id);


--
-- Name: social_system_info social_system_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_system_info
    ADD CONSTRAINT social_system_info_pkey PRIMARY KEY (slug);


--
-- Name: social_user_approve social_user_approve_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_approve
    ADD CONSTRAINT social_user_approve_id_key UNIQUE (id);


--
-- Name: social_user_approve social_user_approve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_approve
    ADD CONSTRAINT social_user_approve_pkey PRIMARY KEY (id);


--
-- Name: social_user_block social_user_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_block
    ADD CONSTRAINT social_user_block_pkey PRIMARY KEY (id);


--
-- Name: social_user_friend social_user_friend_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_friend
    ADD CONSTRAINT social_user_friend_pkey PRIMARY KEY (id);


--
-- Name: social_users social_users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_users
    ADD CONSTRAINT social_users_email_key UNIQUE (email);


--
-- Name: social_users social_users_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_users
    ADD CONSTRAINT social_users_phone_key UNIQUE (phone);


--
-- Name: social_users social_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_users
    ADD CONSTRAINT social_users_pkey PRIMARY KEY (id);


--
-- Name: social_users social_users_user_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_users
    ADD CONSTRAINT social_users_user_code_key UNIQUE (user_code);


--
-- Name: social_rosters unique_user_friend; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_rosters
    ADD CONSTRAINT unique_user_friend UNIQUE (user_id, friend_id);


--
-- Name: social_user_bi_level unique_user_id_bi_level_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_bi_level
    ADD CONSTRAINT unique_user_id_bi_level_id UNIQUE (user_id, bi_level_id);


--
-- Name: social_group_member unique_userid_group_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_group_member
    ADD CONSTRAINT unique_userid_group_id UNIQUE (user_id, group_id);


--
-- Name: user_approve user_approve_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_approve
    ADD CONSTRAINT user_approve_id_key UNIQUE (id);


--
-- Name: user_approve user_approve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_approve
    ADD CONSTRAINT user_approve_pkey PRIMARY KEY (id);


--
-- Name: user_approve user_approve_user_id_type; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_approve
    ADD CONSTRAINT user_approve_user_id_type UNIQUE (user_id, type);


--
-- Name: social_user_bi_level user_rank_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_bi_level
    ADD CONSTRAINT user_rank_id_key UNIQUE (id);


--
-- Name: social_user_bi_level user_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_bi_level
    ADD CONSTRAINT user_rank_pkey PRIMARY KEY (id);


--
-- Name: social_users users_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_users
    ADD CONSTRAINT users_key UNIQUE (id);


--
-- Name: social_chat_group_member set_public_group_chat_member_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_group_chat_member_updated_at BEFORE UPDATE ON public.social_chat_group_member FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_chat_group_messages set_public_group_chat_messages_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_group_chat_messages_updated_at BEFORE UPDATE ON public.social_chat_group_messages FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_chat_groups set_public_group_chat_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_group_chat_updated_at BEFORE UPDATE ON public.social_chat_groups FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_group_member set_public_group_member_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_group_member_updated_at BEFORE UPDATE ON public.social_group_member FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_groups set_public_groups_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_groups_updated_at BEFORE UPDATE ON public.social_groups FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_messages set_public_messages_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_messages_updated_at BEFORE UPDATE ON public.social_messages FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_user_notices set_public_notice_user_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_notice_user_updated_at BEFORE UPDATE ON public.social_user_notices FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_post_comment set_public_post_comment_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_post_comment_updated_at BEFORE UPDATE ON public.social_post_comment FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_posts set_public_posts_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_posts_updated_at BEFORE UPDATE ON public.social_posts FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_rosters set_public_roster_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_roster_updated_at BEFORE UPDATE ON public.social_rosters FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_users set_public_social_users_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_social_users_updated_at BEFORE UPDATE ON public.social_users FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: TRIGGER set_public_social_users_updated_at ON social_users; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TRIGGER set_public_social_users_updated_at ON public.social_users IS 'trigger to set value of column "updated_at" to current timestamp on row update';


--
-- Name: social_user_block set_public_user_block_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_user_block_updated_at BEFORE UPDATE ON public.social_user_block FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_user_friend set_public_user_friend_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_user_friend_updated_at BEFORE UPDATE ON public.social_user_friend FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_user_bi_level set_public_user_rank_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_public_user_rank_updated_at BEFORE UPDATE ON public.social_user_bi_level FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: social_chat_group_member social_group_chat_member_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_chat_group_member
    ADD CONSTRAINT social_group_chat_member_fk FOREIGN KEY (group_chat_id) REFERENCES public.social_chat_groups(id);


--
-- Name: social_chat_group_messages social_group_chat_messages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_chat_group_messages
    ADD CONSTRAINT social_group_chat_messages_fk FOREIGN KEY (group_id) REFERENCES public.social_chat_groups(id);


--
-- Name: social_post_comment social_post_comment_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_post_comment
    ADD CONSTRAINT social_post_comment_fk FOREIGN KEY (post_id) REFERENCES public.social_posts(id);


--
-- Name: social_posts social_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_posts
    ADD CONSTRAINT social_posts_fk FOREIGN KEY (group_id) REFERENCES public.social_groups(id);


--
-- Name: social_rosters social_roster_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_rosters
    ADD CONSTRAINT social_roster_fk FOREIGN KEY (group_id) REFERENCES public.social_groups(id);


--
-- Name: social_user_bi_level user_rank_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_user_bi_level
    ADD CONSTRAINT user_rank_fk_2 FOREIGN KEY (bi_level_id) REFERENCES public.social_bi_levels(id);


--
-- PostgreSQL database dump complete
--

