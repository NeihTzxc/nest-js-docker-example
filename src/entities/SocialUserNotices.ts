import { Column, Entity, Index } from "typeorm";

@Index("social_notice_user_pkey", ["id"], { unique: true })
@Entity("social_user_notices", { schema: "public" })
export class SocialUserNotices {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("timestamp without time zone", { name: "send_at" })
  sendAt: Date;

  @Column("timestamp without time zone", { name: "read_at", nullable: true })
  readAt: Date | null;

  @Column("bigint", { name: "user_id" })
  userId: string;

  @Column("text", { name: "title", nullable: true })
  title: string | null;

  @Column("text", { name: "content", nullable: true })
  content: string | null;

  @Column("text", { name: "media_uri", nullable: true })
  mediaUri: string | null;
}
